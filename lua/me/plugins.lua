local boostrap, packer = require("me.util").ensure_packer()

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
  use "wbthomason/packer.nvim"

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
      require("nvim-treesitter.install").update { }
    end,
  }

  use {
    "rmehri01/onenord.nvim",
    "p00f/nvim-ts-rainbow",
  }

  if bootstrap then
    packer.sync()
  end
end)
