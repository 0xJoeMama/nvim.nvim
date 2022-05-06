local dashboard = require('alpha.themes.dashboard')

dashboard.leader = vim.g.mapleader;
dashboard.section.footer.val = "Brought to you by 0xJoeMama ©"
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<cmd>ene <CR>"),
    dashboard.button("ff", "  Find file", "<cmd>Telescope find_files<CR>"),
    dashboard.button("fw", "  Find word", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("ec", "⚙️ Edit Configuration", "<cmd>e " .. os.getenv("HOME") .. "/.config/nvim/<CR>")
}

require('alpha').setup(dashboard.config)

local M = {}

M.list_bookmarks = function()
    vim.notify(vim.inspect(vim.api.nvim_buf_get_extmarks()))
end

return M
