local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

local function comment_string(_, _, _)
  local comment = vim.bo.commentstring:gsub(" %%s", "")
  return comment or ""
end

ls.add_snippets("all", {
  s(
    "todo",
    fmt("{} {}: {}", {
      f(comment_string, { 1 }),
      c(1, {
        t("TODO"),
        t("FIX"),
        t("NOTE"),
        t("HACK"),
        t("WARN"),
        t("TEST"),
        t("PERF"),
      }),
      i(2),
    })
  ),
})
