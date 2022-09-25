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
  local on_attach = function(_, bfn)
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
          },
          f = {
            action = vim.lsp.buf.formatting,
            desc = "Format current file",
            opts = buf_opts,
          },
          r = {
            action = vim.lsp.buf.rename,
            desc = "Rename symbol",
            opts = buf_opts,
          },
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
          },
        },
      },
    }
  end

  local lua_runtime_files = vim.api.nvim_get_runtime_file("", true)
  table.insert(lua_runtime_files, "/usr/share/awesome/lib/")

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
              globals = { "vim", "awesome", "client", "screen", "root" },
            },
            workspace = {
              library = lua_runtime_files,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
    },
    "clangd",
    "rust_analyzer",
    "denols"
  }, on_attach)

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
    }
  }
end)
