local bootstrap, packer = require("me.util").packer.ensure_packer()

packer.startup {
  function(use)
    use {
      "wbthomason/packer.nvim",
      "rmehri01/onenord.nvim",
      "folke/tokyonight.nvim",
      "catppuccin/nvim",
      "martinsione/darkplus.nvim",
      "lewis6991/impatient.nvim",
      "andweeb/presence.nvim",
      "nvim-treesitter/playground",
      "b0o/schemastore.nvim",
      "folke/lsp-colors.nvim",
      "simrat39/rust-tools.nvim",
      {
        "p00f/nvim-ts-rainbow",
        requires = {
          "nvim-treesitter/nvim-treesitter",
        },
      },
      {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
        },
      },
      {
        "nvim-treesitter/nvim-treesitter",
        run = function()
          require("me.util").setup("nvim-treesitter.install", "update") {}
        end,
      },
      "akinsho/toggleterm.nvim",
      "folke/which-key.nvim",
      "rcarriga/nvim-notify",
      {
        "kyazdani42/nvim-tree.lua",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
      },
      "kylechui/nvim-surround",
      "windwp/nvim-autopairs",
      {
        "nvim-lualine/lualine.nvim",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
      },
      "lewis6991/gitsigns.nvim",
      "numToStr/Comment.nvim",
      {
        "goolord/alpha-nvim",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        requires = {
          "neovim/nvim-lspconfig",
          "williamboman/mason.nvim",
        },
      },
      {
        -- notice how i dont lock this because i dont know what
        -- the correct lock would be in this case
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
      "ahmedkhalf/project.nvim",
      "RRethy/vim-illuminate",
      "akinsho/bufferline.nvim",
      "j-hui/fidget.nvim",
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
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
    autoremove = true,
  }
}
