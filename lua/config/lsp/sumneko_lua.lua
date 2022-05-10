local M = {}

M.setup = function(lspconfig, caps, on_attach)
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    lspconfig.sumneko_lua.setup {
        capabilities = caps,
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern 'stylua.toml',
        cmd = { os.getenv 'HOME' .. '/.local/share/nvim/lsp/lua-language-server/bin/lua-language-server' },
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', false),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end

return M
