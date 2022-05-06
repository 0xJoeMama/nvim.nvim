local autopairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'

autopairs.setup {
    check_ts = true,
    fast_wrap = {
        map = '<A-w>',
    },
}

autopairs.add_rules {
    Rule('<', '>'),
}

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
