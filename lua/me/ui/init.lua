local ui = {}

ui.create_popup = function(txt, callback)
  local Menu = require("nui.menu")

  local items = {}
  for i, line in ipairs(txt) do
    table.insert(items, Menu.item(line, { idx = i }))
  end

  local menu = Menu({
    relative = "cursor",
    position = {
      row = 2,
      col = 0,
    },
    border = {
      style = "rounded",
      text = {
        top = "[Code Actions]",
        top_align = "left",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  }, {
    lines = items,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = function(item)
      callback { line = item.idx }
    end,
  })

  menu:mount()
end

ui.create_prompt = function(prompt, default, callback)
  local Input = require("nui.input")

  local popup_options = {
    relative = "cursor",
    position = {
      row = 1,
      col = 0,
    },
    size = {
      width = 40,
      height = 1,
    },
    border = {
      style = "rounded",
      text = {
        top = "[" .. prompt .. "]",
        top_align = "left",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal",
    },
  }

  local input = Input(popup_options, {
    prompt = " ",
    default_value = default,
    on_submit = function(value)
      callback(value)
    end,
  })

  input:mount()
end

return ui
