require("me.util").safe_run("null-ls", function(null_ls)
  local builtins = require("null-ls.builtins")
  null_ls.setup {
    sources = {
      -- formatters
      builtins.formatting.stylua,
      builtins.formatting.prettier,
      builtins.formatting.eslint_d,
      builtins.formatting.autopep8,
      builtins.formatting.autoflake,
      builtins.formatting.rustfmt,
      builtins.formatting.clang_format,

      -- linters
      builtins.diagnostics.eslint_d,
      builtins.diagnostics.shellcheck,
      builtins.diagnostics.markdownlint,
      builtins.diagnostics.selene,
      builtins.diagnostics.flake8,
    },
  }
end)
