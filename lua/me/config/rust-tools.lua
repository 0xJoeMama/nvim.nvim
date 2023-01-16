require("me.util").setup("rust-tools") {
  tools = {
    inlay_hints = {
      -- auto = true,
      auto = false,
      other_hints_prefix = ": ",
    },
  },
  server = {
    standalone = true,
    on_attach = require("me.lsp").on_attach,
  },
}
