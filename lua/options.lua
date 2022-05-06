vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.mouse = 'a'
vim.opt.background = 'dark'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim/undoes'
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 300
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.cmdheight = 2
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } -- cmp requires these for some reason..
vim.opt.conceallevel = 0
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false

-- Appending/removing to/from existing lists
vim.opt.clipboard:append('unnamedplus')
vim.opt.shortmess:append('c')
vim.opt.whichwrap:append('<,>,[,],h,l')
vim.opt.iskeyword:append('-')
vim.opt.formatoptions:remove('cro') -- seems to not work for some weird reason

vim.opt.laststatus = 3
