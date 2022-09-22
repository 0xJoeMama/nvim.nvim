local util = require("me.util")
local has_run = false

util.safe_run("cmp", function(cmp)
  cmp.setup {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered {
        border = "double",
      },
    },
    preselect = cmp.PreselectMode.Item,
    completion = {
      autocomplete = {
        cmp.TriggerEvent.TextChanged,
        cmp.TriggerEvent.InsertEnter,
      },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-u>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ["<Tab>"] = function (fallback)
        local luasnip = require("luasnip")

        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function (fallback)
        local luasnip = require("luasnip")

        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = "path", trigger_characters = {"/"} },
      { name = "buffer", keyword_length = 5 },
    },
    experimental = {
      ghost_text = true,
    },
  }

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources {
      { name = 'cmp_git' },
    }
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  if not has_run then
    util.safe_run('nvim-autopairs.completion.cmp', function (cmp_autopairs)
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end)

    has_run = true
  end
end)

