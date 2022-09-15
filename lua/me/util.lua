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
    local mod = prequire(module)

    if not (mod == nil) then
      table.insert(res, mod)
    else
      return nil
    end
  end

  return res
end

M.apply_settings = function(target, settings)
  for opt, value in pairs(settings) do
    if type(value) == "function" then
      value(target[opt])
    else
      target[opt] = value
    end
  end
end

return M
