local exit_ins = function()
  return {
    action = "<Esc>",
    desc = "Exit insert mode quickly",
  }
end

local no_op = function()
  return {
    action = "<Nop>",
  }
end

require("me.util").apply_keys {
  n = {
    ["<leader>"] = {
      e = {
        action = "<cmd>E<cr>",
        desc = "Open the file explorer",
      },
      xs = {
        action = "<cmd>source %<cr>",
        desc = "Source the current file",
      },
      w = {
        action = "<cmd>w<cr>",
        desc = "Save the current file",
      },
      q = {
        action = "<cmd>q<cr>",
        desc = "Save and quit the current file",
      },
    },
    ["<Backspace>"] = no_op(),
    ["<Space>"] = no_op(),
    s = no_op(),
    ["<C-h>"] = {
      action = "<C-w>h",
      desc = "Quick move left",
    },
    ["<C-j>"] = {
      action = "<C-w>j",
      desc = "Quick move down",
    },
    ["<C-k>"] = {
      action = "<C-w>k",
      desc = "Quick move up",
    },
    ["<C-l>"] = {
      action = "<C-w>l",
      desc = "Quick move right",
    },
  },
  i = {
    jk = exit_ins(),
    kj = exit_ins(),
  },
}
