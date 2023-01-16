require("me.util").safe_run("telescope", function(telescope)
  telescope.setup {
    defaults = {
      color_devicons = true,
      scroll_strategy = "limit",
      prompt_prefix = "  ",
      selection_caret = "🡆 ",
      multi_icon = "🡆 ",
      history = true,
      winblend = 10,
    },
    pickers = {
      find_files = {
        layout_strategy = "center",
        previewer = false,
      },
    },
    extensions = {},
  }

  telescope.load_extension("notify")
  telescope.load_extension("projects")
end)
