local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

local f1 = [[fn {}({}: {}) -> {} {{
  {}
}}
]]
local f2 = [[fn {}({}: {}) {{
  {}
}}
]]
local fg1 = [[fn {}<{}>({}: {}) -> {} {{
  {}
}}
]]
local fg2 = [[fn {}<{}>({}: {}) {{
  {}
}}
]]
ls.add_snippets("rust", {
  s("fn", {
    c(1, {
      fmt(f1, { r(1, "name"), r(2, "arg"), r(3, "Type"), r(4, "RetType"), r(5, "body") }),
      fmt(f2, { r(1, "name"), r(2, "arg"), r(3, "Type"), r(4, "body") }),
      fmt(fg1, { r(1, "name"), r(2, "generic"), r(3, "arg"), r(4, "Type"), r(5, "RetType"), r(6, "body") }),
      fmt(fg2, { r(1, "name"), r(2, "generic"), r(3, "arg"), r(4, "Type"), r(5, "body") }),
    }),
  }, {
    stored = {
      -- key passed to restoreNodes.
      ["name"] = i(1, "name"),
      ["generic"] = i(2, "T"),
      ["arg"] = i(3, "arg"),
      ["Type"] = i(4, "Type"),
      ["RetType"] = i(5, "RetType"),
      ["body"] = i(6, "todo!()"),
    },
  }),
})
