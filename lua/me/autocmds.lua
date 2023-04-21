local util = require("me.util")
local group = util.autocmd.group
local cmd = util.autocmd.cmd

local resource_config = group("SourceConfig")
local my_group = group("Mine")


cmd {
  events = "BufWritePost",
  opts = {
    group = resource_config,
    pattern = vim.fn.stdpath("config") .. "/*.lua",
    callback = function(args)
      vim.notify("Configuration files have changed", vim.log.levels.INFO, {
        title = "Sourcing config...",
      })
      vim.cmd("source " .. args.file)
    end,
  },
}

cmd {
  events = "BufWritePost",
  opts = {
    group = resource_config,
    pattern = vim.fn.stdpath("config") .. "*plugins.lua",
    callback = function()
      vim.notify("Packer configuration has been modified", vim.log.levels.INFO, {
        title = "Syncing...",
      })
      require("packer").sync()
    end,
  },
}

cmd {
  events = "TextYankPost",
  opts = {
    group = my_group,
    callback = function()
      vim.highlight.on_yank {
        timeout = 100,
      }
    end,
  },
}

cmd {
  events = { "BufWinEnter", "BufRead", "BufNewFile" },
  opts = {
    group = my_group,
    callback = function()
      vim.cmd([[
      setlocal formatoptions-=cro
      ]])
    end,
  },
}

