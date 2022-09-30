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
        branch = "0.1.x",
      },
      {
        "nvim-treesitter/nvim-treesitter",
        run = function()
          require("me.util").setup("nvim-treesitter.install", "update") {}
        end,
        commit = "aebc6cf6bd4675ac86629f516d612ad5288f7868",
      },
      {
        "akinsho/toggleterm.nvim",
        commit = "e1e159c1b2075cfe9803dfdc521d028e48f6c1a4",
      },
      {
        "folke/which-key.nvim",
        commit = "92d924d1f4ec67a86a4d54c3ea22caf8ad09a5d4",
      },
      {
        "rcarriga/nvim-notify",
        commit = "7a9be08986b4d98dd685a6b40a62fcba19c1ad27",
      },
      {
        "kyazdani42/nvim-tree.lua",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
        tag = "nightly",
      },
      {
        "kylechui/nvim-surround",
        tag = "v1.0.0",
      },
      {
        "windwp/nvim-autopairs",
        commit = "14cc2a4fc6243152ba085cc2059834113496c60a",
      },
      {
        "nvim-lualine/lualine.nvim",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
        commit = "a52f078026b27694d2290e34efa61a6e4a690621",
      },
      {
        "lewis6991/gitsigns.nvim",
        tag = "v0.5",
      },
      {
        "numToStr/Comment.nvim",
        commit = "30d23aa2e1ba204a74d5dfb99777e9acbe9dd2d6",
      },
      {
        "goolord/alpha-nvim",
        requires = {
          "kyazdani42/nvim-web-devicons",
        },
        commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31",
      },
      {
        "williamboman/mason-lspconfig.nvim",
        requires = {
          "neovim/nvim-lspconfig",
          "williamboman/mason.nvim",
        },
        commit = "b70dedab5ceb5f3f84c6bc9ceea013292a14f8dc",
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
              {
                "L3MON4D3/LuaSnip",
                tag = "v1.0.0",
              },
            },
          },
        },
      },
      {
        "ahmedkhalf/project.nvim",
        commit = "628de7e433dd503e782831fe150bb750e56e55d6",
      },
      {
        "RRethy/vim-illuminate",
        commit = "a2e8476af3f3e993bb0d6477438aad3096512e42",
      },
      {
        "akinsho/bufferline.nvim",
        tag = "v2.11.1",
      },
      {
        "j-hui/fidget.nvim",
        commit = "492492e7d50452a9ace8346d31f6d6da40439f0e",
      },
      {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        commit = "dbfd8e96ec2696e1ceedcd23fd70e842256e3dea",
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
      {
        "lukas-reineke/indent-blankline.nvim",
        tag = "v2.20.2",
      }
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
  },
}
