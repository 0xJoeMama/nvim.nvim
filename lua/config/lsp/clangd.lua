local M = {}

M.setup = function(lspconfig, caps, on_attach)
    lspconfig.clangd.setup {
        on_attach = on_attach,
        capabilities = caps,
        root_dir = lspconfig.util.root_pattern('compile_commands.json'),
        cmd = { 'clangd', },
    }
end

return M
