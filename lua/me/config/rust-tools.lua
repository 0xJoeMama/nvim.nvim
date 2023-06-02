require("me.util").setup("rust-tools") {
  tools = {
    inlay_hints = {
      auto = true,
      other_hints_prefix = "=> ",
      parameter_hints_prefix = ": ",
    },
  },
  server = {
    standalone = false,
    on_attach = require("me.lsp").on_attach,
    handlers = require("me.lsp").handlers,
  },
}
