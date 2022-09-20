require("me.util").safe_run("which-key", function(which_key)
  which_key.setup {
    key_labels = {
      ["<space>"] = "Space",
      ["<cr>"] = "Enter",
      ["<tab>"] = "Tab",
    },
    window = {
      border = "rounded",
    },
  }
end)
