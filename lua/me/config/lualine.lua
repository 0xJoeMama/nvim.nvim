require("me.util").setup("lualine") {
  options = {
    component_separators = "",
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {
        "TelescopePrompt",
        "alpha",
      },
    },
    ignore_focus = {},
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "", right = "" }, right_padding = 2 }
    },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {
      {
        function()
          local active_clients = vim.lsp.buf_get_clients()

          if #active_clients > 0 then
            local bfn = vim.api.nvim_get_current_buf()
            local icon = require("me.util").safe_run("nvim-web-devicons", function(icons)
              return icons.get_icon_by_filetype(vim.fn.getbufvar(bfn, "&filetype"))
            end)
            return icon .. " " .. active_clients[1].name
          else
            return "No LSP"
          end
        end,
      }, "encoding", "fileformat", "progress",
    },
    lualine_z = {
      { "location", separator = { right = "", left = "" }, left_padding = 2 }
    },
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "quickfix",
    "man",
  },
}
