local M = {}

M.setup = function(lspconfig, caps, on_attach)
    lspconfig.pyright.setup {
        on_attach = on_attach,
        capabilities = caps,
    }
end

return M
