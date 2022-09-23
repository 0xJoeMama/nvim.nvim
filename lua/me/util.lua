local function prequire(module)
  local ok, val = pcall(require, module)

  if not ok then
    return nil
  else
    return val
  end
end

function P(table)
  print(vim.inspect(table))
end

local M = {}

function M.load_modules(mods)
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

  local parsed = parse_all(mods)

  for _, module in ipairs(parsed) do
    local mod = prequire(module)
    if not mod then
      err = true
      table.insert(res, module)
    elseif type(mod) == "function" then
      mod(M)
    end
  end

  return err, res
end

M.safe_run = function(modname, action)
  local mod = prequire(modname)

  if not mod then
    vim.notify("Module " .. modname .. " could not be loaded!")
  end

  return action(mod)
end

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

M.keymap = {
  apply_keys = function(keys)
    local function into_table(key, curr_obj)
      if curr_obj.action then
        curr_obj.trigger = key

        return { curr_obj }
      else
        local inner_keys = {}

        for new_key, new_obj in pairs(curr_obj) do
          for _, mapping in ipairs(into_table(key .. new_key, new_obj)) do
            table.insert(inner_keys, mapping)
          end
        end

        return inner_keys
      end
    end

    for mode, mappings in pairs(keys) do
      local parsed = into_table("", mappings)

      for _, parsed_map in ipairs(parsed) do
        local opts = parsed_map.opts or {
          noremap = false,
          silent = true,
        }

        opts.desc = parsed_map.desc or opts.desc or ""

        vim.keymap.set(mode, parsed_map.trigger, parsed_map.action, opts)
      end
    end
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

M.prequire = prequire

M.lsp = {
  load_lsps = function(lspconfig, cfg, on_attach)
    local function load(lsp, settings)
      local server = lspconfig[lsp]
      if not server then
        vim.notify("Could not find " .. lsp, vim.log.levels.WARN, {
          title = "LSP not found!",
        })
      end
      settings = settings or {}

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

      capabilities.textDocument.completion.completionItem.snippetSupport = false
      settings.capabilities = capabilities
      settings.on_attach = on_attach

      server.setup(settings)
    end

    for _, lsp in ipairs(cfg) do
      if type(lsp) == "string" then
        load(lsp)
      else
        load(lsp.name, lsp.config)
      end
    end
  end,
}

M.setup = function(module, setup_name)
  return function(cfg)
    M.safe_run(module, function(mod)
      if not setup_name then
        mod.setup(cfg)
      else
        mod[setup_name](cfg)
      end
    end)
  end
end

return M
