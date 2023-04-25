-- TODO: Currently not used but it will be kept in case someone wants to load it
require("me.util").setup("lsp_lines") {}
vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
}
