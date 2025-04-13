return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = opts.keymap or {}
    opts.keymap["<C-u>"] = { "scroll_documentation_up" }
    opts.keymap["<C-d>"] = { "scroll_documentation_down" }
  end,
}
