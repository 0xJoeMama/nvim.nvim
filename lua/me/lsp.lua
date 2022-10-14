-- mason-lspconfig says that load order should be as follows:
-- - mason
-- - mason-lspconfig
-- - lspconfig
local util = require("me.util")
local M = {}

M.on_attach = function(_, bfn)
  local buf_opts = {
    noremap = true,
    silent = true,
    buffer = bfn,
  }

  util.keymap.apply_keys({
    n = {
      ["<leader>"] = {
        o = {
          action = function()
            vim.lsp.buf.references {
              includeDeclaration = false,
            }
          end,
          desc = "List LSP references"
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
        }
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
  ensure_installed = {},
  automatic_installation = true,
}

util.safe_run("lspconfig", function(lspconfig)
  util.lsp.load_lsps(lspconfig, {
    {
      "sumneko_lua",
      config = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim", },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
    },
    "clangd",
    -- "rust_analyzer", ATTENTION: Always make sure this is disabled if you are using rust-tools.nvim
    "denols",
    "zls",
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
    "denols",
    "taplo",
    "svelte",
  }, M.on_attach)

  for key, sign in pairs({
    Error = {
      text = "",
    },
    Warn = {
      text = "",
    },
    Hint = {
      text = "💡",
    },
    Info = {
      text = "",
    },
  }) do
    sign.texthl = "Diagnostic" .. key
    vim.fn.sign_define("DiagnosticSign" .. key, sign)
  end

  vim.diagnostic.config {
    float = {
      border = "rounded",
    },
    virtual_text = false,
  }
end)

return M
