local group = require("me.util").autocmd.group
local cmd = require("me.util").autocmd.cmd

local resource_config = group("SourceConfig")

cmd {
  events = "BufWritePost",
  opts = {
    group = resource_config,
    pattern = vim.fn.stdpath("config") .. "/*.lua",
    callback = function(args)
      vim.notify("Configuration files changed, sourcing...", vim.log.levels.INFO)
      vim.cmd("source " .. args.file)
    end,
  },
}

cmd {
  events = "BufWritePost",
  opts = {
    group = resource_config,
    pattern = vim.fn.stdpath("config") .. "*plugins.lua",
    callback = function(args)
      vim.notify("Packer configuration has been modified! Syncing...", vim.log.levels.INFO)
      require("packer").sync()
    end,
  },
}
