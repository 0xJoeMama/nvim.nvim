-- ATTENTION: hack to improve runtime performance and cover some edge cases
-- make sure you remove this before considering something a bug!!!
vim.cmd = function(viml)
  vim.api.nvim_exec(viml, false)
end

local ok, util = pcall(require, "me.util")

if not ok then
  return
end

local err, issue = util.load_modules {
  "me.options",
  "me.keymaps",
  "me.plugins",
  "me.config.treesitter",
  "me.colors",
}

if err then
  vim.notify("There was an issue while loading module " .. issue, vim.log.levels.WARN)
end
