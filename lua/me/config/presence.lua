require("me.util").safe_run("presence", function(presence)
  presence:setup {
    main_image = "file",
    enable_line_number = true,
  }
end)
