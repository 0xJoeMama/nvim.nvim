vim.ui.select = function(items, opts, on_choice)
  if #items == 0 then
    return
  end

  local formatted = {}
  for i, item in ipairs(items) do
    local formatted_item = opts.format_item(item)
    formatted[formatted_item] = {
      index = i,
      item = item,
    }
  end

  local max_width = 0
  for formatted_item, _ in pairs(formatted) do
    local len = string.len(formatted_item)

    if max_width > len then
      max_width = len
    end
  end

  if max_width == 0 then
    max_width = 64
  end

  local size = {
    x = max_width,
    y = #items
  }

  local txt = {}
  for desc, item in pairs(formatted) do
    txt[item.index] = " -> " .. desc
  end

  require("me.ui").create_popup(size, txt, function(ctx)
    if not ctx then
      on_choice(nil, nil)
    else
      on_choice(items[ctx.line], ctx.line)
    end
  end)
end
