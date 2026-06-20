local util = require("me.util")

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
  -- mouse off for the love of god
  mouse = "",
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
  hlsearch = false,  -- disables highlight
  ignorecase = true, -- together with smartcase makes searches ignore casing except when a capital is present
  smartcase = true,  -- ^^
  incsearch = true,  -- show search results *while* the pattern is being typed out
  cmdheight = 1,     -- make the command bar smoll
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
  laststatus = 3,
  -- neovide font
  guifont = "JetBrainsMono Nerd Font:h10",
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
  fillchars = function(fillchars)
    fillchars:append("eob: ")
  end,
  formatoptions = function(formatoptions) -- this does not work ?! :concern:
    formatoptions:remove("c")
    formatoptions:remove("r")
    formatoptions:remove("o")
  end,
  foldmethod = "marker", -- markers are cool, give them a try with {\{{ and 'za'
  guicursor = "",
  wildmenu = true,
  wildmode = "noselect:lastused,full",
  path = "**",
}

util.apply(vim.g) {
  mapleader = " ",
  maplocalleader = " ",
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
  loaded_node_provider = 0,
  loaded_python3_provider = 0,
  loaded_ruby_provider = 0,
  loaded_perl_provider = 0,
}


vim.pack.add {
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/neovim-treesitter/nvim-treesitter",
  "https://github.com/neovim-treesitter/treesitter-parser-registry",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
}

vim.cmd.colorscheme("gruvbox")

local ts_lingas = {
  "c", "lua", "cpp", "rust",
  "python", "sql",
}

require("nvim-treesitter").install(ts_lingas)

vim.api.nvim_create_autocmd('FileType', {
  pattern = ts_lingas,
  callback = function()
    vim.treesitter.start() -- highlighting
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'     -- folds
    -- vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
  end,
})

vim.cmd.syntax("on")

require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.config("lua_ls", {
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        }
      },
    },
  },
})

vim.lsp.enable("clangd")
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

require("lualine").setup {
  options = {
    component_separators = "|",
    section_separators = {},
    disabled_filetypes = {},
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
      { "filename", path = 1 },
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

require("oil").setup()
require("gitsigns").setup()

vim.keymap.set({ "t" }, "<Esc>", "<C-\\><C-n>", { remap = true })
vim.keymap.set({ "n" }, "<C-T>", "<cmd>terminal bash -i<enter>I", { remap = true })
vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, { remap = false })
vim.keymap.set({ "n" }, "grf", vim.lsp.buf.format, { remap = false })
