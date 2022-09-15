local opts = {
  number = true,
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smarttab = true,
  mouse = "a",
  background = "dark",
  swapfile = false,
  backup = false,
  writebackup = false,
  undodir = os.getenv("HOME") .. "/.cache/nvim/undoes",
  undofile = true,
  signcolumn = "yes",
  updatetime = 200,
  termguicolors = true,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  cmdheight = 1,
  completeopt = {
    "menu",
    "menuone",
    "noselect",
  },
  conceallevel = 0,
  pumheight = 10,
  showmode = false,
  scrolloff = 8,
  sidescrolloff = 8,
  wrap = false,
  clipboard = function(clip)
    clip:append("unnamedplus") 
    P("Called")
    return clip 
  end,
  whichwrap = function(wrap)
    wrap:append("<,>,[,],h,l")
    return wrap
  end,
  iskeyword = function(keywords)
    keywords:append("-")
  end,
  laststatus = 3,
  guifont = "JetBrains Mono Nerd Font:h11",
}

for opt, value in pairs(opts) do
  if type(value) == "function" then
    value(vim.opt[opt])
  else
    vim.opt[opt] = value
  end
end


