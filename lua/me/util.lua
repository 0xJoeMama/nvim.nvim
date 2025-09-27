local function prequire(module)
  local ok, val = pcall(require, module)

  if not ok then
    return nil
  else
    return val
  end
end

function P(table)
  vim.notify(vim.inspect(table))
  return table
end

local M = {}

M.load_modules = function(mods)
  -- recursively iterate over the mods table and only
  -- return a list of modules once we only get strings
  local function parse_all(mod, prefix)
    if type(mod) == "string" then
      return { mod }
    end

    if prefix then
      prefix = prefix .. "."
    end

    prefix = prefix or ""

    local modules = {}

    for key, sub in pairs(mod) do
      for _, val in ipairs(parse_all(sub, key)) do
        table.insert(modules, prefix .. val)
      end
    end

    return modules
  end

  local err = false
  local res = {}

  -- parse the module table into a list
  local parsed = parse_all(mods)

  -- load all modules safely
  for _, module in ipairs(parsed) do
    local mod = prequire(module)
    if not mod then
      err = true
      table.insert(res, module)
    elseif type(mod) == "function" then
      mod(M)
    end
  end

  -- return whether there was an issue
  -- and also provide the issue itself
  return err, res
end

-- apply an action one a module while making sure that module exists
M.safe_run = function(modname, action)
  local mod = prequire(modname)

  if not mod then
    vim.notify("Module " .. modname .. " could not be loaded!")
    return nil
  end

  return action(mod)
end

-- modify an table using another table
-- values from target must be either a new value or
-- a function that takes in the old value and modifies it
M.apply = function(target)
  return function(settings)
    for opt, value in pairs(settings) do
      if type(value) == "function" then
        value(target[opt])
      else
        target[opt] = value
      end
    end
  end
end

-- keymap sub-module
M.keymap = {
  apply_keys = function(keys, global_opts)
    global_opts = global_opts or {
      noremap = true,
      silent = true,
    }

    local function parse(key, curr_obj)
      if curr_obj.action then
        curr_obj.trigger = key

        return { curr_obj }
      else
        local inner_keys = {}

        for new_key, new_obj in pairs(curr_obj) do
          for _, mapping in ipairs(parse(key .. new_key, new_obj)) do
            table.insert(inner_keys, mapping)
          end
        end

        return inner_keys
      end
    end

    for mode, mappings in pairs(keys) do
      local parsed = parse("", mappings)

      for _, parsed_map in ipairs(parsed) do
        local opts = vim.tbl_deep_extend("force", global_opts, vim.deepcopy(parsed_map.opts or {}))

        opts.desc = parsed_map.desc or opts.desc or ""

        -- vim.keymap.del(mode, parsed_map.trigger)
        vim.keymap.set(mode, parsed_map.trigger, parsed_map.action, opts)
      end
    end
  end,
}

M.lazy = {
  ensure_lazy = function()
    local ret = false
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.uv.fs_stat(lazypath) then
      vim.print("Installing lazy.nvim, please wait.")
      vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      }

      ret = true
    end
    vim.opt.rtp:prepend(lazypath)

    return ret, require("lazy")
  end,
}

M.packer = {
  ensure_packer = function()
    local bootstrap = false
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
      vim.notify("Installing 'packer.nvim'!", vim.log.levels.INFO, {
        title = "Please stand by!",
      })

      fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }

      vim.cmd([[packadd packer.nvim]])

      vim.notify("'packer.nvim' was just installed automatically!", vim.log.levels.INFO)

      bootstrap = true
    end

    return bootstrap, require("packer")
  end,
}

M.autocmd = {
  group = function(arg)
    if type(arg) == "string" then
      return vim.api.nvim_create_augroup(arg, {
        clear = true,
      })
    end

    return vim.api.nvim_create_augroup(arg.name, arg.opts)
  end,
  cmd = function(arg)
    if type(arg.opts) == "function" or type(arg.opts) == "string" then
      arg.opts = {
        callback = arg.opts,
      }
    end

    vim.api.nvim_create_autocmd(arg.events, arg.opts)
  end,
}

M.lsp = {
  load_lsps = function(cfg, glob)
    local function load(lsp, settings)
      settings = settings or {}

      local caps = vim.lsp.protocol.make_client_capabilities()
      M.safe_run("cmp_nvim_lsp", function(cmp)
        caps = cmp.default_capabilities {
          snippetSupport = false,
        }
      end)

      settings.capabilities = caps
      settings.on_attach = glob.on_attach
      settings.handlers = vim.tbl_deep_extend("force", glob.handlers or {}, settings.handlers or {})

      vim.lsp.config(lsp, settings)
    end

    for _, lsp in ipairs(cfg) do
      if type(lsp) == "string" then
        load(lsp)
      else
        load(lsp[1], lsp.config)
      end
    end
  end,
}

M.setup = function(module, setup_name)
  setup_name = setup_name or "setup"

  return function(cfg)
    M.safe_run(module, function(mod)
      mod[setup_name](cfg)
    end)
  end
end

return M
