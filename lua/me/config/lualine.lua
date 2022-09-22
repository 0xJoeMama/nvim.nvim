require("me.util").setup("lualine") {
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
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
    lualine_x = { "filetype", "encoding", "fileformat" },
    lualine_y = {
      function()
        return os.date("%d-%m-%Y %H:%M")
      end,
      "progress",
    },
    lualine_z = { "location" },
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "quickfix",
    "man",
  },
}
