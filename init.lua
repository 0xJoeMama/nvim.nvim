-- firstly attempt to load impatient
pcall(require, "impatient")

local config_main = function()
  -- then try to load util since it's needed everywhere
  local ok, util = pcall(require, "me.util")

  -- exit the config early, since the util module *is* needed
  if not ok then
    return
  end

  -- load the config
  local err, issues = util.load_modules {
    me = {
      "options",
      "keymaps",
      "autocmds",
      "plugins",
      config = {
        "nvim-treesitter",
        "telescope",
        "toggleterm",
        "which-key",
        "notify",
        "nvim-tree",
        "nvim-surround",
        "nvim-autopairs",
        "lualine",
        "gitsigns",
        "comment",
        "alpha",
        "nvim-cmp",
        "presence",
        "luasnip",
        "project",
        "bufferline",
        "illuminate",
        "fidget",
        "lsp-lines",
        "lsp-colors",
        "rust-tools",
      },
      "lsp",
      "colors",
      ui = {
        "lsp",
      },
    },
  }

  -- create an error message if there was an issue with some module
  if err then
    local issue_string = ""
    for _, issue in ipairs(issues) do
      issue_string = issue_string .. "'" .. issue .. "', "
    end

    vim.notify("Modules " .. issue_string .. "were invalid!", vim.log.levels.WARN, {
      title = "Woops, there was issue!",
    })
  end
end

-- run it, in protected mode to catch any and all errors
local ok, _ = pcall(config_main)
if not ok then
  print("Something went terribly wrong! Exiting the config!")
  vim.cmd [[qa!]]
end
