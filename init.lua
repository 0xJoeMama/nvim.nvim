-- evil hack was here but according to docs it hath been changed for a while now
local ok, util = pcall(require, "me.util")

if not ok then
  return
end

local err, issues = util.load_modules {
  "impatient",
  me = {
    "options",
    "keymaps",
    "autocmds",
    "plugins",
    config = {
      "treesitter",
      "telescope",
      "toggleterm",
      "which-key",
      "notify",
      "nvim-tree",
      "nvim-surround",
      "nvim-autopairs",
      "lualine",
      "gitsigns",
      "comment",
      "alpha",
      "nvim-cmp",
      "presence",
      "luasnip",
      "project",
      "bufferline",
      "illuminate",
      "fidget",
      "lsp-lines",
      "lsp-colors",
      "indent_blankline",
    },
    "lsp",
    "colors",
    ui = {
      "lsp",
    },
  },
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
