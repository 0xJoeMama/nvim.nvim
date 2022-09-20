require("me.util").safe_run("nvim-autopairs", function(autopairs)
  autopairs.setup {
    check_ts = true,
    ts_config = {},
  }
end)
