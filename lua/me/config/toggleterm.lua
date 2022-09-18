require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = "float",
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  float_opts = {
    border = 'curved',
  },
}
