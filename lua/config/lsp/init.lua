local M = {}

M.setup = function(caps)
    local lspconfig = require 'lspconfig'
    local map = vim.keymap.set
    local mkopts = function(desc)
        return {
            noremap = true,
            silent = true,
            desc = desc,
        }
    end

    local on_attach = function()
        map('n', 'gd', vim.lsp.buf.definition, mkopts 'Goto definition of the current symbol')
        map('n', 'gD', vim.lsp.buf.declaration, mkopts 'Goto the declaration of the current symbol')
        map('n', '<leader>nn', vim.lsp.buf.rename, mkopts 'Rename the current symbol')
        map('n', '<leader>f', vim.lsp.buf.formatting, mkopts 'Format the current buffer')
    end

    local configured_servers = {
        'sumneko_lua',
        'clangd',
        'jsonls',
        'html',
    }

    for _, server in ipairs(configured_servers) do
        local success, mod = pcall(require, 'config.lsp.' .. server)

        if success then
            mod.setup(lspconfig, caps, on_attach)
        else
            vim.notify('Could not locate configuration for server ' .. server)
        end
    end
end

return M
