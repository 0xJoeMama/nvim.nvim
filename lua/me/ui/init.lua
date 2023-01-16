local ui = {}

local calculate_size = function(text)
  local curr_max = 0

  for _, line in ipairs(text) do
    local length = string.len(line)
    if length > curr_max then
      curr_max = length
    end
  end

  return {
    x = curr_max,
    y = #text,
  }
end

ui.create_popup = function(txt, callback, opts)
  opts = opts or {}

  local size = opts.size or calculate_size(txt)

  local bfn = vim.api.nvim_create_buf(false, true)
  local winh = vim.api.nvim_open_win(bfn, false, {
    relative = "cursor",
    width = size.x,
    height = size.y,
    anchor = "SW",
    focusable = false,
    border = "rounded",
    noautocmd = true,
    col = 0,
    row = 0,
    style = "minimal",
  })

  local hl_namespace = vim.api.nvim_create_namespace("CustomSpace")

  local set_cursor = function(new_row, new_col)
    new_row = new_row or 1
    new_col = new_col or opts.cursor_col

    if new_row < 1 then
      return
    end

    if new_row > size.y then
      return
    end

    vim.api.nvim_buf_clear_namespace(bfn, hl_namespace, 0, -1)
    vim.api.nvim_win_set_cursor(winh, { new_row, new_col })
    vim.api.nvim_buf_add_highlight(bfn, hl_namespace, "Visual", new_row - 1, 0, -1)

    for _, hl in ipairs(opts.highlights or {}) do
      vim.api.nvim_buf_add_highlight(bfn, hl_namespace, hl, new_row - 1, 0, -1)
    end
  end

  vim.api.nvim_set_current_win(winh)
  vim.api.nvim_buf_set_lines(bfn, 0, -1, false, txt)
  set_cursor()

  vim.bo[bfn].modifiable = false
  vim.bo[bfn].filetype = "CodeActionPrompt"

  local close_fn = function()
    vim.api.nvim_win_close(winh, true)
    vim.api.nvim_buf_delete(bfn, { force = true })
    callback(nil)
  end

  local map_opts = {
    buffer = bfn,
    noremap = true,
    silent = true,
  }

  vim.keymap.set("n", "<Esc>", close_fn, map_opts)
  vim.keymap.set("n", "q", close_fn, map_opts)
  vim.keymap.set("n", "h", function() end, map_opts)
  vim.keymap.set("n", "j", function()
    set_cursor(vim.fn.line(".") + 1)
  end, map_opts)
  vim.keymap.set("n", "k", function()
    set_cursor(vim.fn.line(".") - 1)
  end, map_opts)
  local accept = function()
    callback { win = winh, buffer = bfn, line = vim.fn.line(".") }
    close_fn()
  end

  vim.keymap.set("n", "l", accept, map_opts)
  vim.keymap.set("n", "<CR>", accept, map_opts)
end

return ui
