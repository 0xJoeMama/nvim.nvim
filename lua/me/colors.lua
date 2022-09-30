local colorschemes = {
  tokyonight = {
    config = {
      style = "night",
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        sidebars = "dark",
      },
      sidebars = {
        "packer",
        "NvimTree",
      },
      use_background = true,
    }
  },
  catppuccin = {
    config = {
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        keywords = { "bold" },
        sidebars = "dark",
        floats = "dark",
      },
    },
    before_load = function()
      vim.g.catppuccin_flavour = "macchiato"
    end,
  },
  onenord = {
    config = {
      theme = "dark",
      styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "bold",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "underline",
      },
    },
    highlight_extras = function(hl)
      hl {
        "IlluminatedWordText",
        values = {
          bg = "#3F4758"
        },
      }

      hl {
        "IlluminatedWordRead",
        values = {
          bg = "#3F4758",
        },
      }

      hl {
        "IlluminatedWordWrite",
        values = {
          bg = "#3F4758",
        },
      }

      hl {
        "illuminatedWord",
        values = {
          bg = "#3F4758",
        },
      }

      hl {
        "illuminatedCurrWord",
        values = {
          bg = "#3F4758",
        },
      }
    end
  }
}

local current_scheme = "tokyonight"

local before_load =  colorschemes[current_scheme].before_load

if before_load then
  before_load()
end

require(current_scheme).setup(colorschemes[current_scheme].config)
vim.api.nvim_exec("colorscheme " .. current_scheme, false)
vim.g.colors_name = current_scheme

local extra = colorschemes[current_scheme].highlight_extras

if extra then
  extra(function(args)
    local group = args[1]
    local values = args.values

    vim.api.nvim_set_hl(0, group, values)
  end)
end

