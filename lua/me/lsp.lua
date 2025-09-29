-- mason-lspconfig says that load order should be as follows:
-- - mason
-- - mason-lspconfig
-- - lspconfig
local util = require("me.util")
local M = {}

M.on_attach = function(server, bfn)
  local buf_opts = {
    noremap = true,
    silent = true,
    buffer = bfn,
  }

  util.keymap.apply_keys({
    n = {
      K = {
        action = function()
          vim.lsp.buf.hover {
            border = "rounded",
          }
        end,
        desc = "Hover information",
      },
      ["<leader>"] = {
        o = {
          action = function()
            vim.lsp.buf.references {
              includeDeclaration = false,
            }
          end,
          desc = "List LSP references",
        },
        l = {
          d = {
            action = vim.lsp.buf.definition,
            desc = "Goto definition",
          },
          D = {
            action = vim.lsp.buf.declaration,
            desc = "Goto declaration",
          },
          i = {
            action = vim.lsp.buf.implementation,
            desc = "Goto implementation",
          },
          a = {
            action = vim.lsp.buf.code_action,
            desc = "List code actions",
          },
          f = {
            action = function()
              vim.lsp.buf.format { async = true }
            end,
            desc = "Format current file",
          },
          r = {
            action = vim.lsp.buf.rename,
            desc = "Rename symbol",
          },
        },
      },
      g = {
        d = {
          action = vim.lsp.buf.definition,
          desc = "Goto definition",
        },
        D = {
          action = vim.lsp.buf.declaration,
          desc = "Goto declaration",
        },
      },
    },
  }, buf_opts)

  vim.lsp.inlay_hint.enable(true, {bufnr = bfn})

  -- automatically refresh codelens when it's available
  if server.server_capabilities.codeLensProvider then
    util.autocmd.cmd {
      events = {
        "BufEnter",
        "CursorHold",
        "InsertLeave",
      },
      opts = {
        group = util.autocmd.group("CodeLensRefresh"),
        callback = function()
          require("vim.lsp.codelens").refresh()
        end,
        buffer = bfn,
      },
    }
  end
end

util.setup("mason") {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "🕑",
      package_uninstalled = "❌",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 8,
}

util.setup("mason-lspconfig") {
  automatic_installation = false
}

util.lsp.load_lsps({
  {
    "lua_ls",
    config = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("*", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
  },
  {
    "clangd",
    config = {
      root_markers = { "compile_commands.json", ".clangd" }
    }
  },
  "denols",
  {
    "jsonls",
    config = {
      settings = {
        json = {
          schemas = require("me.util").safe_run("schemastore", function(schemas)
            return schemas.json.schemas()
          end),
          validate = {
            enable = true,
          },
        },
      },
    },
  },
  "bashls",
  "cssls",
  "pyright",
  "html",
  "yamlls",
  "taplo",
  "svelte",
  "ts_ls",
  "asm_lsp",
  "gradle_ls",
  "kotlin_language_server",
  "vhdl_ls",
  "texlab"
}, {
  on_attach = M.on_attach,
})

vim.diagnostic.config {
  float = { border = "rounded" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = true,
}

return M
