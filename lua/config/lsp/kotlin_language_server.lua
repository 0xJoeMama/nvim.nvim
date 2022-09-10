local M = {}

M.setup = function(lspconfig, caps, on_attach)
    lspconfig.kotlin_language_server.setup {
        on_attach = on_attach,
        capabilities = caps,
        root_dir = lspconfig.util.root_pattern 'main.kt',
    }
end

return M
