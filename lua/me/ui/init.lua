local ui = {}

ui.create_popup = function(size, txt, callback)
  local bfn = vim.api.nvim_create_buf(false, true)
  local winh = vim.api.nvim_open_win(bfn, false, {
    relative = "cursor",
    width = size.x,
    height = size.y,
    anchor = "SW",
    focusable = false,
    border = "double",
    noautocmd = true,
    col = 0,
    row = 0,
    style = "minimal",
  })

  local hl_namespace = vim.api.nvim_create_namespace("CustomSpace")

  local set_cursor = function(new_row, new_col)
    new_row = new_row or 1
    new_col = new_col or 0

    if new_row < 1 then
      return
    end

    if new_row > size.y then
      return
    end

    vim.api.nvim_buf_clear_namespace(bfn, hl_namespace, 0, -1)
    vim.api.nvim_win_set_cursor(winh, { new_row, new_col })
    vim.api.nvim_buf_add_highlight(bfn, hl_namespace, "Visual", new_row - 1, 0, -1)
  end

  vim.api.nvim_set_current_win(winh)
  vim.api.nvim_buf_set_lines(bfn, 0, -1, false, txt)
  set_cursor()

  vim.bo.modifiable = false

  local close_fn = function()
    vim.api.nvim_win_close(winh, true)
    vim.api.nvim_buf_delete(bfn, { force = true, })
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
  vim.keymap.set("n", "l", function()
    callback { win = winh, buffer = bfn, line = vim.fn.line(".") }
    close_fn()
  end, map_opts)
end

return ui
