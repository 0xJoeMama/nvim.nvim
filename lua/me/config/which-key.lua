require("which-key").setup {
  key_labels = {
    ["<space>"] = "Space",
    ["<cr>"] = "Enter",
    ["<tab>"] = "Tab",
  },
  window = {
    border = "double",
    padding = {
      1,
      0,
      3,
      0,
    },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = false,
  show_help = true,
}
