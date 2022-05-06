local packer = require 'packer'

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
        prompt_border = 'rounded',
    },
}

packer.startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- I mean this should be required but whatever lol
    use { 'nvim-treesitter/nvim-treesitter', run = '<cmd>TSUpdate<cr>' }

    -- Close brackets automatically
    use 'windwp/nvim-autopairs'

    -- Theme
    use 'navarasu/onedark.nvim'

    -- Telescope for fuzzy finding as well as history listings
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }

    -- File Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            { 'kyazdani42/nvim-web-devicons' },
        },
    }

    -- LSP Config
    use 'neovim/nvim-lspconfig'

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    }

    -- Formatter
    use {
        'onsails/lspkind-nvim',
        requires = {
            'hrsh7th/nvim-cmp',
        },
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- Opening screen
    use 'goolord/alpha-nvim'

    use 'ur4ltz/surround.nvim'
    -- packer.sync()
end)
