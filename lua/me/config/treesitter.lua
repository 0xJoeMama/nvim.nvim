require("nvim-treesitter.configs").setup {
  auto_install = true,
  ensure_installed = {
    "lua",
    "c",
    "cpp",
    "kotlin",
    "rust",
    "javascript",
    "typescript",
    "haskell",
    "bash",
    "python",
    "zig",
    "html",
    "json",
    "toml",
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
}
