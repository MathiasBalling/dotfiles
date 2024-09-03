return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    delele_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<C-s>"] = "<Cmd>w<CR>",
      ["|"] = "actions.select_vsplit",
      ["_"] = "actions.select_split",
      ["gf"] = "actions.copy_entry_path",
      ["gt"] = "actions.open_terminal",
      ["q"] = "actions.close",
    },
  },
  keys = {
    { "-", "<Cmd>Oil<CR>", desc = "Open parent directory" },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
