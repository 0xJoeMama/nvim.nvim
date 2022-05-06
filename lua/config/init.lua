require 'config.nvim_tree'
require 'config.treesitter'
require 'config.lualine'
require 'config.lspkind'
require 'config.autopairs'
-- require('config.which_key')
require 'config.alpha'
require 'config.surround'
require 'config.telescope'

local capabilities = require 'config.cmp'
require('config.lsp').setup(capabilities)
