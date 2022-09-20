require("me.util").safe_run("telescope", function(telescope)
  telescope.setup {
    defaults = {
      color_devicons = true,
      scroll_strategy = "limit",
      prompt_prefix = " ",
      selection_caret = "🡆 ",
      multi_icon = "🡆 ",
      history = false,
    },
    pickers = {
      find_files = {
        layout_strategy = "center",
        previewer = false,
      },
    },
  }
end)
