require("me.util").safe_run("nvim-autopairs", function(npairs)
  npairs.setup {
    check_ts = true,
    ts_config = {},
    disable_in_macro = true,
    enable_check_bracket_line = false,
  }

  local ts_conds = require("nvim-autopairs.ts-conds")
  local Rule = require("nvim-autopairs.rule")

  npairs.add_rules {
    Rule("|", "|", "rust") -- automatically create closures in Rust?!
      :with_pair(ts_conds.is_ts_node("arguments")),
  }
end)
