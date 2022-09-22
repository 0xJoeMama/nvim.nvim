-- mason-lspconfig says that load order should be as follows:
-- - mason
-- - mason-lspconfig
-- - lspconfig
local util = require("me.util")

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
  local on_attach = function (_, bfn)
    local buf_opts = {
      noremap = true,
      silent = true,
      buffer = bfn,
    }

    util.keymap.apply_keys {
      n = {
        ["<leader>l"] = {
          d = {
            action = vim.lsp.buf.definition,
            desc = "Goto definition",
            opts = buf_opts,
          },
          D = {
            action = vim.lsp.buf.declaration,
            desc = "Goto declaration",
            opts = buf_opts,
          },
          i = {
            action = vim.lsp.buf.implementation,
            desc = "Goto implementation",
            opts = buf_opts,
          },
          a = {
            action = vim.lsp.buf.code_action,
            desc = "List code actions",
            opts = buf_opts,
          }
        },
        g = {
          d = {
            action = vim.lsp.buf.definition,
            desc = "Goto definition",
            opts = buf_opts,
          },
          D = {
            action = vim.lsp.buf.declaration,
            desc = "Goto declaration",
            opts = buf_opts,
          }
        },
      },
    }
  end

  util.lsp.load_lsps(lspconfig, {
    {
      name = "sumneko_lua",
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
  }, on_attach)
end)
