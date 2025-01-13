require("me.util").setup("nvim-treesitter.configs") {
  ensure_installed = {
    "c",
    "cpp",
    "latex",
    "javascript",
    "python",
    "typescript",
    "rust",
    "lua",
    "vim",
    "markdown",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "css",
    "json",
    "bash",
    "asm",
    "toml",
  },
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
  query_linter = {
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
}

require("me.util").setup("nvim-ts-autotag") {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
  per_filetype = {},
}
