require("tokyonight").setup {
  theme = "storm",
  styles = {
    comments = "italic",
    strings = "NONE",
    keywords = "bold",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "undercurl",
  },
}

vim.cmd("colorscheme tokyonight")

local hl = function(args)
  local group = args[1]

  local values = args.values

  vim.api.nvim_set_hl(0, group, values)
end

-- used by illuminate. Onenord does include these groups 
-- but they dont seem to work for some weird reason
hl {
  "IlluminatedWordText",
  values = {
    bg = "#3F4758",
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
