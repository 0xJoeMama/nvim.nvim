require 'config.nvim_tree'
require 'config.treesitter'
require 'config.lualine'
require 'config.lspkind'
require 'config.autopairs'
require 'config.alpha'
require 'config.surround'
require 'config.telescope'
require 'config.bufferline'
require 'config.gitsigns'

local capabilities = require 'config.cmp'
require('config.lsp').setup(capabilities)

require('copilot').setup {
    cmp = {
        enabled = true,
        method = 'getCompletionsCycling',
    },
}
