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

local telescope_builtins = require("telescope.builtin")

require("me.util").keymap.apply_keys {
  n = {
    ["<leader>"] = {
      e = {
        action = require("nvim-tree.api").tree.toggle,
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
      f = {
        action = telescope_builtins.find_files,
        desc = "Find files using Telescope",
      },
      t = {
        f = {
          action = telescope_builtins.find_files,
          desc = "Find files using Telescope",
        },
        g = {
          action = telescope_builtins.live_grep,
          desc = "Grep over files",
        },
        h = {
          action = telescope_builtins.help_tags,
          desc = "Open help tags",
        },
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
    ["<C-t>"] = {
      action = "<cmd>ToggleTerm<cr>",
      desc = "Toggle Toggleterm view",
    },
    FF = {
      action = "<cmd>wqa<cr>",
      desc = "KILL IT!",
    },
    ZZ = no_op(),
  },
  i = {
    jk = exit_ins(),
    kj = exit_ins(),
  },
  v = {
    ["<"] = {
      action = "<gv",
      desc = "Keep selected area after manual indentation",
    },
    [">"] = {
      action = ">gv",
      desc = "Keep selected area after manual indentation",
    },
  },
  t = {
    ["<C-t>"] = {
      action = "<cmd>ToggleTerm<cr>",
      desc = "Toggle Toggleterm view",
    },
  },
}
