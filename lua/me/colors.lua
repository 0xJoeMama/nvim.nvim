local current_scheme = "onenord"

local colorschemes = {
  tokyonight = {
    config = {
      style = (function()
        -- local day_hour = tonumber(os.date("%H"))
        -- if day_hour > 18 then
        --   return "night"
        -- else
        --   return "storm"
        -- end
        return "storm"
      end)(),
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
    },
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
      for _, group in ipairs {
        "IlluminatedWordText",
        "IlluminatedWordRead",
        "IlluminatedWordWrite",
        "illuminatedWord",
        "illuminatedCurrWord",
      } do
        hl {
          group,
          values = {
            bg = "#3F4758",
          },
        }
      end
    end,
  },
}

current_scheme = current_scheme or "tokyonight"
local scheme_config = colorschemes[current_scheme] or {}
local before_load = scheme_config.before_load

if before_load then
  before_load()
end

local ok, scheme = pcall(require, current_scheme)
if ok then
  scheme.setup(scheme_config.config or {})
end

vim.api.nvim_exec("colorscheme " .. current_scheme, false)
vim.g.colors_name = current_scheme

local extra = scheme_config.highlight_extras

if extra then
  extra(function(args)
    local group = args[1]
    local values = args.values

    vim.api.nvim_set_hl(0, group, values)
  end)
end
