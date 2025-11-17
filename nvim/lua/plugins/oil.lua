return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    delele_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    use_default_keymaps = false,
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["g|"] = { "actions.select", opts = { vertical = true } },
      ["g_"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["H"] = { "actions.parent", mode = "n" },
      ["L"] = { "actions.select", mode = "n" },

      ["<C-p>"] = "actions.preview",

      ["<C-c>"] = function()
        local oil = require("oil")
        oil.discard_all_changes()
        oil.close()
      end,
      ["Q"] = function()
        local oil = require("oil")
        oil.discard_all_changes()
        oil.close()
      end,

      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["~"] = { "actions.cd", mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },

      ["<C-q>"] = "actions.send_to_qflist",
      ["gp"] = "actions.yank_entry",
      ["gf"] = "actions.copy_entry_filename",
      ["gt"] = "actions.open_terminal",
    },
  },
  keys = {
    { "-", "<Cmd>Oil<CR>", desc = "Oil" },
    { "fpo", "<Cmd>Oil ~/projects/<CR>", desc = "Oil" },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
