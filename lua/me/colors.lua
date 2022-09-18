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
local hl = function(grp)
  return function(hls)
    vim.api.nvim_set_hl(0, grp, hls)
  end
end

if not vim.g.neovide then
end
