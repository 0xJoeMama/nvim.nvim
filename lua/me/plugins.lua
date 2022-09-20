local boostrap, packer = require("me.util").packer.ensure_packer()

packer.startup {
  function(use)
    use {
      "wbthomason/packer.nvim",
      "rmehri01/onenord.nvim",
      "martinsione/darkplus.nvim",
      "lewis6991/impatient.nvim",
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
          require("nvim-treesitter.install").update {}
        end,
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
        requires = { "kyazdani42/nvim-web-devicons" },
        commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31",
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
  },
}
