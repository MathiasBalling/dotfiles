local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
--
ls.add_snippets("cpp", {
  s("p", {
    c(1, {
      fmt('std::println("{}");', { i(1, "") }),
      fmt('std::println("{}: {{}}", {});', { rep(1), i(1, "") }),
    }),
  }),
})

ls.add_snippets("cpp", {
  s("co", {
    c(1, {
      fmt('std::cout << "{}" std::endl;', { i(1, "") }),
      fmt('std::cout << "{}: " << {} std::endl;', { rep(1), i(1, "") }),
    }),
  }),
})
