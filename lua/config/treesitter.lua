require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'c', 'rust', 'json', 'yaml', 'java', 'kotlin', 'cpp', 'javascript', 'typescript', },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_formatting = false,
    },
    highlights = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
