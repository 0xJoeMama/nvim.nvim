-- ATTENTION: hack to improve runtime performance and cover some edge cases
-- make sure you remove this before considering something a bug!!
vim.cmd = function(viml)
  vim.api.nvim_exec(viml, false)
end

local ok, util = pcall(require, "me.util")

if not ok then
  return
end

if util.load_modules {
  "me.options",
} == nil then
  return
end

vim.cmd [[
colorscheme slate
]]
