require("me.util").safe_run("luasnip", function(luasnip)
  local s = luasnip.snippet
  local i = luasnip.insert_node
  local t = luasnip.text_node
  local fmt = require("luasnip.extras.fmt").fmt
  local c = luasnip.choice_node
  local d = luasnip.dynamic_node
  local sn = luasnip.snippet_node
  local f = luasnip.function_node

  luasnip.add_snippets("lua", {
    s(
      "ift",
      fmt(
        [[
    if {} then
      {}
    end
    ]],
        {
          i(1),
          i(0),
        }
      )
    ),
    s(
      "fu",
      fmt(
        [[
    function({})
      {}
    end
    ]],
        {
          i(1),
          i(0),
        }
      )
    ),
    s(
      "lfu",
      fmt(
        [[
    local {} = function({})
      {}
    end
    ]],
        {
          i(1, "fn"),
          i(2),
          i(0),
        }
      )
    ),
    -- s("req", fmt([[
    -- local {} = require("{}")
    -- ]], {
    --   f(function(nodes)
    --     return "asb"
    --   end, { 0 }),
    --   i(0)
    -- }))
  })
end)
