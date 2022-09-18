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
}

local hl = vim.api.nvim_set_hl

if not vim.g.neovide then
  hl(0, "TelescopeNormal", {
    fg = "NONE",
    bg = "NONE",
  })
end
