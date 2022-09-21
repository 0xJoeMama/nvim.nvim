require("me.util").safe_run("toggleterm", function(toggleterm)
  toggleterm.setup {
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
      border = "curved",
    },
    shell = "fish"
  }
end)
