require("me.util").setup("gitsigns") {
  signs = {
    add = { text = "▊" },
    change = { text = "▊" },
    delete = { text = "▂" },
    topdelete = { text = "🮂" },
    changedelete = { text = "~" },
  },
  signcolumn = true,
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    delay = 200,
    ignore_whitespace = true,
  },
  preview_config = {
    border = "rounded",
  },
}
