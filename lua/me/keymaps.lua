local util = require("me.util")

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

local telescope_prompt = function(builtin_name)
  return function()
    util.safe_run("telescope.builtin", function(builtins)
      if builtins[builtin_name] then
        builtins[builtin_name]()
      end
    end)
  end
end

local gitsigns = function(action)
  return function()
    util.safe_run("gitsigns", function(gs)
      if gs[action] then
        gs[action]()
      end
    end)
  end
end

util.keymap.apply_keys {
  n = {
    L = {
      action = function()
        util.safe_run("bufferline", function(bufferline)
          bufferline.cycle(1)
        end)
      end,
      desc = "Move to the next buffer",
    },
    H = {
      action = function()
        util.safe_run("bufferline", function(bufferline)
          bufferline.cycle(-1)
        end)
      end,
    },
    ["<leader>"] = {
      ldi = {
        action = function()
          vim.diagnostic.goto_next()
        end,
        desc = "Jump to the next diagnostic",
      },
      e = {
        action = function()
          util.safe_run("nvim-tree.api", function(api)
            api.tree.toggle()
          end)
        end,
        desc = "Open the file explorer",
      },
      [";"] = {
        action = "<cmd>Alpha<cr>",
        desc = "Exit to the welcome screen",
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
        action = telescope_prompt("find_files"),
        desc = "Find files using Telescope",
      },
      g = {
        B = {
          action = gitsigns("blame_line"),
          desc = "Current Line Blame",
        },
        b = {
          action = gitsigns("toggle_current_line_blame"),
          desc = "Toggle Line Blame",
        },
        h = {
          action = gitsigns("preview_hunk"),
          desc = "Preview diff hunk",
        },
      },
      t = {
        f = {
          action = telescope_prompt("find_files"),
          desc = "Find files using Telescope",
        },
        g = {
          action = telescope_prompt("live_grep"),
          desc = "Grep over files",
        },
        h = {
          action = telescope_prompt("help_tags"),
          desc = "Open help tags",
        },
        b = {
          action = telescope_prompt("buffers"),
          desc = "Show bufferlist in Telescope",
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
    ZZ = {
      action = "<cmd>wqa!<cr>",
      desc = "KILL IT!",
    },
    ["<A-h>"] = {
      action = "<cmd>vert res +5<cr>",
      desc = "Increase current window size by 5",
    },
    ["<A-l>"] = {
      action = "<cmd>vert res -5<cr>",
      desc = "Decrease current window size by 5",
    },
    ["<A-j>"] = {
      action = "<cmd>move . +1<cr>==",
      desc = "Move current line down",
    },
    ["<A-k>"] = {
      action = "<cmd>move . -2<cr>==",
      desc = "Move current line up",
    },
    lm = {
      action = "<cmd>Man 2 <cword><cr>",
      desc = "Open man page for currently highlighted symbol",
    },
  },
  i = {
    jk = exit_ins(),
    kj = exit_ins(),
    ["<C-n>"] = {
      action = function()
        util.safe_run("luasnip", function(luasnip)
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          end
        end)
      end,
      desc = "Next luasnip choice",
    },
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
