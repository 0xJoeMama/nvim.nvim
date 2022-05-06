local cmp = require 'cmp'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm { select = true }
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources {
        -- { name = "nvim_lua", priority = 10 }, We no longer need this since the LSP for lua is configured correctly
        { name = 'nvim_lsp', priority = 9 },
        { name = 'luasnip', priority = 8 },
        { name = 'buffer', keyword_length = 5, priority = 0 },
        { name = 'path' },
    },
    formatting = {
        format = lspkind.cmp_format {
            mode = 'symbol_text',
            menu = {
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                -- nvim_lua = '[Lua Engine]', Same as ^^
                luasnip = '[Snippet]',
                path = '[SysPath]',
            },
        },
    },
    experimental = {
        ghost_text = true,
    },
}

return require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
