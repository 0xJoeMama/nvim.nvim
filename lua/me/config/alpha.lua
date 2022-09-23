-- TODO: Finish this?!
require("me.util").safe_run("alpha", function(alpha)
  local dashboard = require("alpha.themes.dashboard")

  dashboard.section.header.val = {
    [[            (                                                                   ]],
    [[           ((((((((((((((((((((((                     (((                       ]],
    [[          (((((((((((((((((((((((((((((             ((((((((                    ]],
    [[         ((((((((((((((((((((((((((((((((         (((((((((((((                 ]],
    [[        (((((((((((((((((((((((((((((((((((     ((((((((((((((((((&             ]],
    [[       (((((((((((((((((((((((((((((((((((((( ((((((((((((((((((((((((          ]],
    [[      #((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((       ]],
    [[      ((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((    ]],
    [[     (((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((( ]],
    [[    ((((((((((((@@@@@@@@          @@@@@@@@@@@@#    @@@@@@@@@@@@@@%((((((((((((((]],
    [[   (((((((((((((@@@@@@@@          @@@@@@@@@@@@#    @@@@@@@@@@@@@@%((((((((((((((]],
    [[  ((((((((((((((@@@@@@@@@@@    @@@@@@@@@@@@@@@#    @@@@@@@@@@@@@@%((((((((((((((]],
    [[ (((((((((((((((@@@@@@@@@@@    @@@@@@@@@@@@@@@#    @@@@@@@@@@@@@@%((((((((((((((]],
    [[   (((((((((((((@@@@@@@@@@@    @@@@@@@@@@@@@@@#    @@@@@@@@@@@@@@%((((((((((((((]],
    [[        ///(((((@@@@@@@@@@@    @@@@@@@@@@@@@@@#    @@@@@@@@@@@@@@%((((((((((((((]],
    [[      (/////////@@@@@@@@@@@    @@@@@@@@  @@@@@     @@@@@@@@@@@@@@%((((((((((((((]],
    [[     ///////////@@@@@@@@          @@@@            @@@@@@@@@@@@@@@%((((((((((((((]],
    [[    ////////////@@@@@@@@@@@@@@@@@@@@@@@@@@#  @@@@@@@@@@@@@@@@@@@@%((((((((((((((]],
    [[  //////////////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((((]],
    [[  //////////////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((((]],
    [[     //////////(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((((]],
    [[        //////((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((((]],
    [[           ///((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((( ]],
    [[             (((@@@@@                  @@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((( ]],
    [[            ((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((( ]],
    [[           (((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((( ]],
    [[           (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((( ]],
    [[          ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((( ]],
    [[         ((((((((((((((((((((    ((((((((((((((((((((((((((((((((((((((((       ]],
    [[        ((((((((((((((               ((((((((((((((((((((((((((((((             ]],
    [[        (((((((                         (((((((((((((((((((((                   ]],
    [[       (                                    ((((((((((%                         ]],
  }

  dashboard.section.header.opts.hl = "Label"

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <cr>"),
    dashboard.button("f", "🔍 Find File", ":Telescope find_files<cr>"),
    dashboard.button("g", "Τ Search in Files", ":Telescope live_grep<cr>"),
    dashboard.button("p", "📂 Open project", ":Telescope projects<cr>"),
    dashboard.button("c", "⚙ Configure Neovim", ":e " .. vim.fn.stdpath("config") .. "/init.lua<cr>"),
    dashboard.button("q", " Quit Neovim", ":wqa<cr>"),
    {
      type = "padding",
      val = 16,
    },
  }

  dashboard.section.footer.val = "Made with ♥ by 0xJoeMama"
  dashboard.config.opts.noautocmd = true

  alpha.setup(dashboard.config)
end)
