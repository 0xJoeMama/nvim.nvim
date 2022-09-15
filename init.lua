vim.cmd = function(viml)
  vim.api.nvim_exec(viml, false)
end

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

local modules = {
  "me.options",
}

for _, module in ipairs(modules) do
  if prequire(module) == nil then
    return
  end
end

vim.cmd[[
colorscheme evening
]]
