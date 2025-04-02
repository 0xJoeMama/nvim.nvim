require("me.util").setup("lualine") {
  options = {
    component_separators = "|",
    section_separators = {},
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
      {
        "mode",
        color = {
          gui = "Bold",
        },
      },
    },
    lualine_b = {
      "branch",
      "diff",
      "diagnostics",
    },
    lualine_c = {
      { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = "" },
      "filename",
    },
    lualine_x = {
      {
        "filetype",
        icon_only = true,
        padding = 0,
        separator = "",
      },
      {
        function()
          local active_clients = vim.lsp.get_clients { bufnr = 0 }

          local final_string = ""
          for _, client in pairs(active_clients) do
            final_string = final_string .. client.name .. ","
          end

          final_string = final_string:sub(1, final_string:len() - 1)

          if final_string == "" then
            return "No LSP"
          else
            return "[" .. final_string .. "]"
          end
        end,
        color = {
          gui = "Bold",
        },
      },
    },
    lualine_y = { "encoding", "fileformat", "progress" },
    lualine_z = { "location" },
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "quickfix",
    "man",
  },
}
