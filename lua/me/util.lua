function prequire(module)
  local ok, val = pcall(require, module)

  if not ok then
    return nil
  else
    return val
  end
end

function P(table)
  vim.notify(vim.inspect(table))
end

local M = {}

M.load_modules = function(mods)
  local res = {}

  for _, module in ipairs(mods) do
    if not prequire(module) then
      return true, module
    end
  end

  return false, nil
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

M.apply_keys = function(keys)
  local function into_table(key, curr_obj, modifiers)
    if curr_obj.action then
      curr_obj.trigger = key

      return {
        curr_obj,
      }
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
        remap = false,
        silent = true,
      }

      opts.desc = parsed_map.desc or opts.desc or ""

      vim.keymap.set(mode, parsed_map.trigger, parsed_map.action, opts)
    end
  end
end

M.ensure_packer = function()
  local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
      vim.notify("Installing 'packer.nvim', please stand by!", vim.log.levels.INFO)
      fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }

      vim.cmd [[packadd packer.nvim]]

      vim.notify("'packer.nvim' was just installed automatically!", vim.log.levels.INFO)

      return true
    end

    return false
  end

  return ensure_packer(), require "packer"
end

return M
