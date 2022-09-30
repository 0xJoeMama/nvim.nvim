require("me.util").safe_run("alpha", function(alpha)
  local dashboard = require("alpha.themes.dashboard")
  local fortune = require("alpha.fortune")

  dashboard.section.header.val = {
    [[,---,---,---,---,---,---,---,---,---,---,---,---,---,-------,]],
    [[|1/2| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | + | ' | <-    |]],
    [[|---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-----|]],
    [[| ->| | Q | W | E | R | T | Y | U | I | O | P | ] | ^ |     |]],
    [[|-----',--',--',--',--',--',--',--',--',--',--',--',--'|    |]],
    [[| Caps | A | S | D | F | G | H | J | K | L | \ | [ | * |    |]],
    [[|----,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---'----|]],
    [[|    | < | Z | X | C | V | B | N | M | , | . | - |          |]],
    [[|----'-,-',--'--,'---'---'---'---'---'---'-,-'---',--,------|]],
    [[| ctrl |  | alt |                          |altgr |  | ctrl |]],
    [['------'  '-----'--------------------------'------'  '------']],
  }

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New File", ":ene <BAR> startinsert <cr>"),
    dashboard.button("f", "🔍 Find File", ":Telescope find_files<cr>"),
    dashboard.button("p", "📂 Open Project", ":Telescope projects<cr>"),
    dashboard.button("c", "⚙  Configure Neovim", ":e " .. vim.fn.stdpath("config") .. "/init.lua<cr>"),
    dashboard.button("q", "  Quit Neovim", ":wqa<cr>"),
  }

  dashboard.section.footer.val = "Made with ♥ by 0xJoeMama"

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
