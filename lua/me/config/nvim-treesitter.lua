require("me.util").setup("nvim-treesitter.configs") {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_lines = nil,
  },
  autotag = {
    enable = true,
    filetypes = {
      "rust", "html", "jsx", "tsx"
    }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  query_linter = {
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
}
