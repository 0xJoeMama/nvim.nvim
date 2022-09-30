local pre_hook = require("me.util").safe_run("ts_context_commentstring.integrations.comment_nvim", function(ts_ctx_cmt)
  return ts_ctx_cmt.create_pre_hook()
end)

require("me.util").setup("Comment") {
  pre_hook = pre_hook,
}
