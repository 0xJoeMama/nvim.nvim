require("me.util").safe_run("telescope", function(telescope)
  telescope.setup {
    defaults = {
      color_devicons = true,
    },
    pickers = {
      find_files = {
        layout_strategy = "center",
        previewer = false,
      },
    },
  }
end)
