require("me.util").setup("nvim-treesitter.configs") {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {
    "help",
  },
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
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  playground = {
    enable = true,
    updatetime = 50,
  },
  query_linter = {
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
}
