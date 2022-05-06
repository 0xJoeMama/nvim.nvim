-- Evil hack to improve runtime and prevent multiline commands from having issues. DO NOT TRY THIS AT HOME IT MAY BREAK STUFF
vim.cmd = function(vimscript)
    vim.api.nvim_exec(vimscript, false)
end

require('options')
require('mappings')
require('colors')
require('autocmd')
require('plugins')
require('config')
