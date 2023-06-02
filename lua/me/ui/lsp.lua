vim.ui.select = function(items, opts, on_choice)
  if #items == 0 then
    return
  end

  local formatted = {}
  for i, item in ipairs(items) do
    local formatted_item = item
    if opts.format_item then
      formatted_item = opts.format_item(item)
    end

    formatted[formatted_item] = {
      index = i,
      item = item,
    }
  end

  local txt = {}
  for desc, item in pairs(formatted) do
    txt[item.index] = " 🠞 " .. desc
  end

  require("me.ui").create_popup(opts.prompt or "Choose", txt, function(ctx)
    if not ctx then
      on_choice(nil, nil)
    else
      on_choice(items[ctx.line], ctx.line)
    end
  end)
end

vim.ui.input = function(opts, on_confirm)
  require("me.ui").create_prompt(opts.prompt, opts.default, function(new_name)
    if new_name then
      on_confirm(new_name)
    end
  end)
end

