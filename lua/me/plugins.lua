local bootstrap, packer = require("me.util").packer.ensure_packer()

packer.startup {
  function(use)
    use {
      -- Package Manager
      "wbthomason/packer.nvim",
      -- Colorschemes
      "rmehri01/onenord.nvim",
      "folke/tokyonight.nvim",
      "catppuccin/nvim",
      "EdenEast/nightfox.nvim",
      "gruvbox-community/gruvbox",
      -- LuaCache implementation aka performance optimization
      "lewis6991/impatient.nvim",
      -- Discord Rich Presence
      "andweeb/presence.nvim",
      -- Telescope for *all* the searching
      {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
        },
      },
      -- Treesitter and related
      {
        "p00f/nvim-ts-rainbow",
        requires = {
          "nvim-treesitter/nvim-treesitter",
        },
      },
      {
        "nvim-treesitter/nvim-treesitter",
        run = function()
          require("me.util").setup("nvim-treesitter.install", "update") {}
        end,
      },
      {
        "windwp/nvim-ts-autotag",
        requires = {
          "nvim-treesitter/nvim-treesitter",
        },
      },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = {
          "nvim-treesitter/nvim-treesitter",
        },
      },
      -- JSON SchemaStore for the JSON LSP
      "b0o/schemastore.nvim",
      -- Colors for LSP groups
      "folke/lsp-colors.nvim",
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
      -- Highlight Selected Symbol(uses/requires LSP)
      {
        "RRethy/vim-illuminate",
        requires = {
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
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
      },
      -- StatusLine
      {
        "nvim-lualine/lualine.nvim",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
      },
      -- Starting Screen
      {
        "goolord/alpha-nvim",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
      },
      -- LSP and related
      {
        "williamboman/mason-lspconfig.nvim",
        requires = {
          "neovim/nvim-lspconfig",
          "williamboman/mason.nvim",
        },
      },
      -- Autocomplete
      {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-path",
          "petertriho/cmp-git",
          "hrsh7th/cmp-cmdline",
          {
            "saadparwaiz1/cmp_luasnip",
            requires = {
              "L3MON4D3/LuaSnip",
            },
          },
        },
      },
      { "zbirenbaum/copilot.lua" },
      {
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
        },
      },
      "MunifTanjim/nui.nvim",
    }

    if bootstrap then
      vim.notify("Running initial sync...", vim.log.levels.INFO, {
        title = "Packer was just installed!",
      })
      packer.sync()
    end
  end,
  config = {
    preview_updates = true,
    display = {
      open_fn = require("packer.util").float,
    },
    log = {
      level = "warn",
    },
    snapshot_path = vim.fn.stdpath("config") .. "/snapshots/",
    autoremove = true,
  },
}
