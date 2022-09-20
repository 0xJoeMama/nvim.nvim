-- TODO: Finish this?!
require("me.util").safe_run("alpha", function(alpha)
  local dashboard = require("alpha.themes.dashboard")

  dashboard.section.header.val = {
    [[                 Once upon a time,                ]],
    [[  there was a coding cat. A cat that could talk!  ]],
    [[When anyone would talk to it, it would always just]],
    [[say stupid shit. No one realised what its purpose ]],
    [[was, yet everyone still decided to see what would ]],
    [[happen to it.                                     ]],
    [[  After time passed, the cat would attend to human]],
    [[school. It would meet mathematics and algebra.    ]],
    [[Moreover, it would realise computers exist. Upon  ]],
    [[that realisation, the cat decided to try its luck ]],
    [[with computers.                                   ]],
    [[  Over time the cat learned how to speak to them. ]],
    [[It could also understand their speech! When people]],
    [[attempted to contact the cat again, it would just ]],
    [[ignore them, without any trace of care.           ]],
    [[  Thus goes the story of the Joe. Yet no one truly]],
    [[knows if that story is real or a product of myth. ]],
  }

  dashboard.section.header.opts.hl = "Label"

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <cr>"),
    dashboard.button("f", "🔍 Find File", ":Telescope find_files<cr>"),
    dashboard.button("g", "Τ Search in Files", ":Telescope live_grep<cr>"),
    dashboard.button("c", "⚙ Configure Neovim", ":e " .. vim.fn.stdpath("config") .. "/init.lua<cr>"),
    dashboard.button("q", " Quit Neovim", ":wqa<cr>"),
  }
  dashboard.section.footer.val = "Made with ♥ by 0xJoeMama"
  dashboard.config.opts.noautocmd = true

  alpha.setup(dashboard.config)
end)
