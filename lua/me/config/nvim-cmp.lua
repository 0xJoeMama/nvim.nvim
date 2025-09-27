local util = require("me.util")
_AUTOPAIRS_INIT = false

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

util.safe_run("cmp", function(cmp)
  local function snippet_filter(entry)
    return entry:get_kind() ~= cmp.lsp.CompletionItemKind.Snippet
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered {
        border = "single",
      },
    },
    preselect = cmp.PreselectMode.Item,
    completion = {
      autocomplete = {
        cmp.TriggerEvent.TextChanged,
      },
      completeopt = "menu,menuone,noselect",
    },
    formatting = {
      fields = {
        "kind",
        "abbr",
        "menu",
      },
      format = function(_, item)
        item.kind = kind_icons[item.kind]
        return item
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-k>"] = cmp.mapping.abort(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
        elseif vim.snippet.active({direction = 1}) then
          vim.snippet.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
        elseif vim.snippet.active({direction = -1}) then
          vim.snippet.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources {
      -- TODO: no snippet support anymore
      { name = "nvim_lsp", entry_filter = snippet_filter },
      { name = "path", trigger_characters = { "/" }, priority = 10 },
      { name = "crates" },
    },
    experimental = {
      ghost_text = true,
    },
  }

  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources {
      { name = "cmp_git" },
    },
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources {
      { name = "path" },
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources {
      { name = "path" },
      { name = "cmdline" },
    },
  })

  if not _AUTOPAIRS_INIT then
    util.safe_run("nvim-autopairs.completion.cmp", function(cmp_autopairs)
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end)
    _AUTOPAIRS_INIT = true
  end
end)
