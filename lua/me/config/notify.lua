local notify = require("notify")

notify.setup { 
  stages = "slide",
  timeout = 2000,
  background_colour = "#121212",
}

vim.notify = notify

