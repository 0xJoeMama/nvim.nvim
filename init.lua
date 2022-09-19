-- ATTENTION: hack to improve runtime performance and cover some edge cases
-- make sure you remove this before considering something a bug!!!
vim.cmd = function(viml)
  vim.api.nvim_exec(viml, false)
end

local ok, util = pcall(require, "me.util")

if not ok then
  return
end

local err, issues = util.load_modules {
  "me.plugins",
  "me.options",
  "me.keymaps",
  "me.autocmds",
  "me.config.treesitter",
  "me.config.telescope",
  "me.config.toggleterm",
  "me.config.which-key",
  "me.config.notify",
  "me.config.nvim-tree",
  "me.config.nvim-surround",
  "me.config.nvim-autopairs",
  "me.colors",
}

if err then
  local issue_string = ""
  for _, issue in ipairs(issues) do
    issue_string = issue_string .. "'" .. issue .. "', "
  end

  vim.notify("Modules " .. issue_string .. "were invalid!", vim.log.levels.WARN, {
    title = "Woops, there was issue!",
  })
end
