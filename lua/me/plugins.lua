local bootstrap, lazy = require("me.util").lazy.ensure_lazy()

if bootstrap then
  vim.notify("Successfully installed 'lazy.nvim'!", vim.log.levels.INFO, {
    title = "Please restart Neovim after plugins are installed!",
  })
end

lazy.setup({
  -- Colorschemes
  "rmehri01/onenord.nvim",
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
  "EdenEast/nightfox.nvim",
  "gruvbox-community/gruvbox",
  "LunarVim/lunar.nvim",
  "LunarVim/darkplus.nvim",
  -- LuaCache implementation aka performance optimization
  "lewis6991/impatient.nvim",
  -- Discord Rich Presence
  "andweeb/presence.nvim",
  -- Telescope for *all* the searching
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- Treesitter and related
  {
    "p00f/nvim-ts-rainbow",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("me.util").setup("nvim-treesitter.install", "update") {}
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- JSON SchemaStore for the JSON LSP
  "b0o/schemastore.nvim",
  -- Rust specific support
  "simrat39/rust-tools.nvim",
  -- Better builtin terminal implementation
  "akinsho/toggleterm.nvim",
  -- Keybind Window: removed as I don't really use it.
  "folke/which-key.nvim",
  -- Fancy notifications
  "rcarriga/nvim-notify",
  -- Surround and autopairs for brackets etc
  "kylechui/nvim-surround",
  "windwp/nvim-autopairs",
  -- Commenting using treesitter
  "numToStr/Comment.nvim",
  -- Git Related things(I personally only care about diff and blame so signs is all a I need)
  "lewis6991/gitsigns.nvim",
  -- Project Management
  "ahmedkhalf/project.nvim",
  -- Highlight Selected Symbol(uses/dependencies LSP)
  {
    "RRethy/vim-illuminate",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  -- Buffer List at the top of the screen
  -- TODO: Remove this and move to a winbar
  "akinsho/bufferline.nvim",
  -- LSP Loading Widget(look at bottom right)
  "j-hui/fidget.nvim",
  -- Better virtual text
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  -- File Explorer
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  -- StatusLine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  -- Starting Screen
  {
    "goolord/alpha-nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  -- LSP and related
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
  },
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "petertriho/cmp-git",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  "L3MON4D3/LuaSnip",
  "zbirenbaum/copilot.lua",
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "MunifTanjim/nui.nvim",
}, {
  defaults = {
    lazy = true, -- TODO: Make sure this doesn't break anything!
    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
  },
  concurrency = 10, ---@type number limit the maximum amount of concurrent tasks
  dev = {
    path = "~/Development/Lua/nvim-plugins",
  },
  install = {
    missing = true,
    colorscheme = { "tokyonight" },
  },
  ui = {
    size = { width = 0.6, height = 0.8 },
    border = "rounded",
    throttle = 20, -- how frequently should the ui process render events
  },
  checker = {
    enabled = false,
    concurrency = 10, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
})
