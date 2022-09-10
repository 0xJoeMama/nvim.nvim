require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'c', 'rust', 'json', 'yaml', 'java', 'kotlin', 'cpp', 'javascript', 'typescript' },
    sync_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_formatting = true,
    },
    highlights = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
