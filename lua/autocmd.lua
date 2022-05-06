local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd -- Auto formatting on save

group('auto-format', { clear = true })
cmd('BufWritePre', {
    callback = function()
        vim.schedule(function()
            vim.lsp.buf.formatting_sync()
        end)
    end,
    group = 'auto-format',
    desc = 'Automatically format a file on save',
})
