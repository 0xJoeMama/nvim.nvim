local M = {}

M.setup = function(lspconfig, caps, on_attach)
    lspconfig.jsonls.setup {
        on_attach = on_attach,
        capabilities = caps,
    }
end

return M
