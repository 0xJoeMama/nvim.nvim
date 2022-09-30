require("me.util").setup("lualine") {
  options = {
    component_separators = "",
    section_separators = "",
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
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {
      {
        "filetype",
        icon_only = true,
      },
      function()
        local active_clients = vim.lsp.buf_get_clients(0)

        local final_string = ""
        for _, client in pairs(active_clients) do
          final_string = final_string .. client.name .. ","
        end

        final_string = final_string:sub(1, final_string:len() - 1)

        if final_string == "" then
          return "No LSP"
        else
          return final_string
        end
      end,
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
