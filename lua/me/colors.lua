require("onenord").setup {
  theme = "dark",
  fade_nc = false,
  styles = {
    comments = "italic",
    strings = "NONE",
    keywords = "bold",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "undercurl",
  },
  disable = {
    background = not vim.g.neovide,
  },
}

local hl = vim.api.nvim_set_hl

if not vim.g.neovide then
  -- vim.cmd[[
  -- hi TelescopeNormal guibg=NONE guifg=NONE
  -- ]]
  hl(0, "TelescopeNormal", {
    fg = "NONE",
    bg = "NONE",
  })
end
