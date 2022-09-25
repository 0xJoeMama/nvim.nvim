local colorschemes = {
  tokyonight = {
    config = {
      theme = "night",
      styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "bold",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "undercurl",
      },
    }
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
        diagnostics = "undercurl",
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

require(current_scheme).setup(colorschemes[current_scheme].config)
vim.api.nvim_exec("colorscheme " .. current_scheme, true)

local extra = colorschemes[current_scheme].highlight_extras

if extra then
  extra(function(args)
    local group = args[1]

    local values = args.values

    vim.api.nvim_set_hl(0, group, values)
  end)
end

