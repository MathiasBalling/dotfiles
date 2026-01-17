return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = opts.keymap or {}
    opts.keymap["<C-u>"] = { "scroll_documentation_up" }
    opts.keymap["<C-d>"] = { "scroll_documentation_down" }
    -- opts.keymap["<C-u>"] = { "scroll_signature_up" }
    -- opts.keymap["<C-d>"] = { "scroll_signature_down" }
    -- opts.keymap["<C-i>"] = { "show_documentation" }
    -- opts.keymap["<C-h>"] = { "hide" }
    -- opts.keymap["<C-s>"] = { "show_signature" }
  end,
}
