local bootstrap, lazy = require("me.util").lazy.ensure_lazy()

if bootstrap then
  vim.notify("Successfully installed 'lazy.nvim'!", vim.log.levels.INFO, {
    title = "Please restart Neovim after plugins are installed!",
  })
end

lazy.setup({
  -- Colorschemes
  { "rmehri01/onenord.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "LunarVim/lunar.nvim", lazy = true },
  { "LunarVim/darkplus.nvim", lazy = true },
  { "LunarVim/onedarker.nvim", lazy = true },
  { "tjdevries/gruvbuddy.nvim", lazy = true },
  { "ellisonleao/gruvbox.nvim", priority = 100 },
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
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("me.util").setup("nvim-treesitter.install", "update") {}
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    ft = {
      "svelte",
      "html",
      "css",
      "lua",
      "xml",
      "tsx",
      "jsx",
      "svelte",
      "python",
      "vim",
      "rust",
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    ft = {
      "html",
      "css",
      "lua",
      "xml",
      "tsx",
      "jsx",
      "svelte",
      "python",
      "vim",
    },
    lazy = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- JSON SchemaStore for the JSON LSP
  {
    "b0o/schemastore.nvim",
    ft = "json",
    lazy = true,
  },
  -- Rust specific support
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require("me.config.rust-tools")
    end,
    lazy = true,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("me.config.crates")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
  },
  -- Better builtin terminal implementation
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    lazy = true,
    config = function()
      require("me.config.toggleterm")
    end,
  },
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
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    cmd = "Telescope projects",
    config = function()
      require("me.config.project")
    end,
  },
  -- Buffer List at the top of the screen
  -- TODO: Remove this and move to a winbar
  "akinsho/bufferline.nvim",
  -- LSP Loading Widget(look at bottom right)
  {
    "j-hui/fidget.nvim",
    lazy = true,
    config = function()
      require("me.config.fidget")
    end,
    event = "LspAttach",
    tag = "legacy",
  },
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
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
  },
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "petertriho/cmp-git",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    config = function()
      require("me.config.luasnip")
    end,
  },
  {
    "mhartington/formatter.nvim",
    lazy = true,
    config = function()
      require("me.config.formatter")
    end,
    cmd = {
      "Format",
      "FormatWriteLock",
      "FormatLock",
      "FormatWrite",
    },
  },
  { "MunifTanjim/nui.nvim", lazy = true },
}, {
  defaults = {
    lazy = false,
  },
  install = {
    missing = true,
    colorscheme = { "gruvbox" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
  },
  checker = {
    enabled = false,
    notify = true,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
})
