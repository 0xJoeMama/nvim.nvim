local util = prequire("me.util")

util.apply(vim.opt) {
  -- ***only*** use UTF-8 for character encoding
  encoding = "utf-8",
  -- disable vi compat
  compatible = false,
  -- delay counting of keys or whatever its called
  timeoutlen = 800,
  -- hide closed buffers
  hidden = true,
  -- line numbers
  number = true,
  relativenumber = true,
  -- 2 wide tabs made of spaces
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smarttab = true,
  autoindent = true,
  smartindent = true,
  shiftround = true, -- round to shiftwidth
  -- mouse
  mouse = "a",
  -- background
  background = "dark",
  -- disable all backup functions except for undo files
  -- set the correct directory for those
  swapfile = false,
  backup = false,
  writebackup = false,
  undodir = os.getenv("HOME") .. "/.cache/nvim/undoes",
  undofile = true,
  -- always add a signcolumn
  signcolumn = "yes",
  -- faster will make ui update quicker at the cost of performance
  updatetime = 200,
  -- colours
  termguicolors = true,
  -- search options
  hlsearch = false, -- disables highlight
  ignorecase = true, -- together with smartcase makes searches ignore casing except when a capital is present
  smartcase = true, -- ^^
  incsearch = true, -- show search results *while* the pattern is being typed out
  cmdheight = 2, -- make the command bar smoll
  -- cmp asked for these
  completeopt = {
    "menu",
    "menuone",
    "noselect",
  },
  conceallevel = 0,
  pumheight = 10,
  -- disable the current mode indicator, as the statusline handles that for us
  showmode = false,
  -- scroll down 8 items earlier
  scrolloff = 8,
  -- scroll to the side 8 items earlier
  sidescrolloff = 8,
  -- do not wrap lines for the love of god
  wrap = false,
  -- always display the statusline
  laststatus = 2,
  -- neovide font
  guifont = "JetBrainsMono Nerd Font:h11",
  -- highlight current line
  cursorline = true,
  clipboard = function(clip)
    -- makes vim immediate register correspond to the system clipboard and vise-versa
    clip:append("unnamedplus")
  end,
  whichwrap = function(wrap)
    -- consider these jumpable when on different lines
    wrap:append("<,>,[,],h,l")
  end,
  iskeyword = function(keywords)
    -- make '-' separated words count as a singular word
    keywords:append("-")
  end,
  splitright = true,
  splitbelow = true,
  confirm = true,
  pumblend = 10,
  winblend = 10,
}

util.apply(vim.g) {
  neovide_transparency = 0.95,
  neovide_refress_rate = 60,
  neovide_idle_refresh_rate = 24,
  neovide_cursor_vfx_mode = "wireframe",
  mapleader = " ",
  maplocalleader = " ",
  loaded_netrw = 1,
  loaded_netrmPlugin = 1,
}
