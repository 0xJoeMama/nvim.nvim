local notify = require("notify")

notify.setup { 
  stages = "slide",
  timeout = 2000,
}

vim.notify = notify

