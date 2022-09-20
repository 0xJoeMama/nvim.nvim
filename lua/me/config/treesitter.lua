require("me.util").safe_run("nvim-treesitter.configs", function(ts)
  ts.setup {
    auto_install = true,
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
end)
