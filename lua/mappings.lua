vim.g.mapleader = ' '

local remap = function(mode, lhs, rhs, opts)
    pcall(vim.keymap.del, mode, lhs) -- Safe call in case a mapping isn't set
    return vim.keymap.set(mode, lhs, rhs, opts)
end

local map = vim.keymap.set

local make_opt = function(desc)
    return {
        silent = true,
        noremap = true,
        desc = desc,
    }
end

local M = {
    telescope_invoke = remap(
        'n',
        'T',
        require('telescope.builtin').find_files,
        make_opt 'Find a project file by name using Telescope.'
    ),

    nvim_tree_toggle = remap(
        'n',
        '<leader>e',
        require('nvim-tree').toggle,
        make_opt 'Toggle the view of the NvimTree plugin.'
    ),

    quick_quit = remap('n', 'ZZ', '<cmd>wqa<cr>', make_opt 'Save everything and exit vim'),
    keep_sel = map('v', '<', '<gv', make_opt 'Indent selected text'),
    keep_sel_right = map('v', '>', '>gv', make_opt 'Indent selected text'),

    quick_save = remap('n', '<leader>w', '<cmd>w<cr>', make_opt 'Save the current buffer'),
    quick_close = map('n', '<leader>q', '<cmd>bd<cr>', make_opt 'Close the current buffer'),

    telescope_live_grep = map(
        'n',
        'gr',
        require('telescope.builtin').live_grep,
        make_opt 'Grep over files in the currect workspace'
    ),
}

return M
