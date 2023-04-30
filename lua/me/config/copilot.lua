require("me.util").setup("copilot") {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
    },
  },
}
