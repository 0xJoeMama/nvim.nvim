-- firstly enable luacache loader
vim.loader.enable()

-- Removed since the newest versions of neovim actually can do this out-of-the-box using the command above
-- local impatient_ok, impatient = pcall(require, "impatient")
--
-- if impatient_ok then
--   impatient.enable_profile()
-- end

local config_main = function()
  -- then try to load util since it's needed everywhere
  local ok, util = pcall(require, "me.util")

  -- exit the config early, since the util module *is* required for any of this to work
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
        "telescope",
        "nvim-treesitter",
        "which-key",
        "notify",
        "nvim-tree",
        "nvim-surround",
        "nvim-autopairs",
        "rainbow-delimiters",
        "lualine",
        "gitsigns",
        "comment",
        "alpha",
        "nvim-cmp",
        "presence"
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
  vim.cmd([[qa!]])
end
