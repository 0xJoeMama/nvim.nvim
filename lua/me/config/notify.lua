require("me.util").safe_run("notify", function(notify)
  notify.setup {
    stages = "fade_in_slide_out",
    timeout = 1000,
    background_colour = "#121212",
  }

  vim.notify = notify
end)
