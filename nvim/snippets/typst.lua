local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

local ts = vim.treesitter

--- Return true if cursor is inside a `math` node
local function in_typst_math()
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = "typst"

  -- Parse the buffer
  local parser = ts.get_parser(bufnr, lang)
  if not parser then
    vim.notify("No parser for " .. lang .. " found")
    return false
  end
  local tree = parser:parse()[1]
  local root = tree:root()

  -- Cursor position
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1 -- Treesitter rows are 0-based

  vim.notify(string.format("cursor: %d %d", row, col))

  -- Treesitter query (only math nodes)
  local query = ts.query.parse(
    lang,
    [[
    (math) @math
  ]]
  )
  vim.notify(string.format("query: %s", query))

  for _, node in query:iter_captures(root, bufnr, row, row + 1) do
    vim.notify(string.format("node: %s", node:type()))
    local sr, sc, er, ec = node:range()

    vim.notify(string.format("math: %d %d %d %d", sr, sc, er, ec, row, col))
    if (row > sr or (row == sr and col >= sc)) and (row < er or (row == er and col <= ec)) then
      vim.notify("In math")
      return true
    end
  end
  vim.notify("Not in math")
  return false
end

ls.add_snippets("typst", {
  s({ trig = "$ ", snippetType = "autosnippet" }, fmt("$ {} $", { i(1) })),
})

ls.add_snippets("typst", {
  s({ trig = "$$", snippetType = "autosnippet" }, fmt("${}$", { i(1) })),
})

ls.add_snippets("typst", {
  s({ trig = "_(", snippetType = "autosnippet", condition = in_typst_math }, fmt("_({})", { i(1) })),
})

ls.add_snippets("typst", {
  s({ trig = "^(", snippetType = "autosnippet", condition = in_typst_math }, fmt("^({})", { i(1) })),
})
