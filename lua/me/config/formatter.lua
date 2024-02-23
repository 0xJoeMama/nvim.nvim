require("me.util").setup("formatter") {
  logging = false,
  filetypes = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
      require("formatter.filetypes.typescript").eslint_d,
    },
    python = {
      require("formatter.filetypes.python").autopep8,
      require("formatter.filetypes.python").autoflake,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    -- not using since it does annoying shit
    -- builtins.formatting.clang_format,
  },
}
