require("me.util").safe_run("alpha", function(alpha)
  local dashboard = require("alpha.themes.dashboard")
  local fortune = require("alpha.fortune")

  dashboard.section.header.val = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  }

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New File", "<cmd>ene <BAR> startinsert <cr>"),
    dashboard.button("f", "  Find File", "<cmd>Telescope find_files<cr>"),
    dashboard.button("g", "  Live Grep", "<cmd>Telescope live_grep<cr>"),
    dashboard.button("p", "  Open Project", "<cmd>Telescope projects<cr>"),
    dashboard.button("b", "  Show Keybinds", "<cmd>WhichKey<cr>"),
    dashboard.button("c", "  Configure Neovim", "<cmd>e " .. vim.fn.stdpath("config") .. "/init.lua<cr>"),
    dashboard.button("u", "  Update Plugins", "<cmd>PackerSync<cr>"),
    dashboard.button("q", "  Quit Neovim", "<cmd>wqa<cr>"),
  }

  dashboard.section.footer.val = "Made with   by 0xJoeMama"

  dashboard.config.opts.noautocmd = true

  local layout = dashboard.config.layout
  table.insert(layout, 4, {
    type = "text",
    val = fortune(),
    opts = {
      position = "center",
      hl = "String",
    },
  })
  table.insert(layout, 5, {
    type = "padding",
    val = 2,
  })

  alpha.setup(dashboard.config)
end)
