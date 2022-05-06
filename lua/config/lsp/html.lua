local M = {}

M.setup = function(lspconfig, caps, on_attach)
    lspconfig.html.setup {
        on_attach = on_attach,
        capabilities = caps,
    }
end

return M
