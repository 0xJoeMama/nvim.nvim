local boostrap, packer = require("me.util").packer.ensure_packer()

packer.init {
  preview_updates = true,
  display = {
    open_fn = require("packer.util").float,
  },
  log = {
    level = "warn",
  },
  autoremove = true,
}

packer.startup(function(use)
  use {
    "wbthomason/packer.nvim",
  }

  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update {}
    end,
  }

  use {
    "rmehri01/onenord.nvim",
    "p00f/nvim-ts-rainbow",
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
      branch = "master",
    },
    {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      tag = 'nightly'
    }
  }

  if bootstrap then
    packer.sync()
  end
end)
