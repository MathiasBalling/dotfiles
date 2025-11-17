return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fq",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume yazi",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    open_multiple_tabs = false,
    keymaps = {
      change_working_directory = "<c-w>",
      show_help = "<c-h>",
    },
    integrations = {
      grep_in_directory = "snacks.picker",
      grep_in_selected_files = "snacks.picker",
    },
  },
  -- init = function()
  --   -- Block netrw plugin load
  --   -- vim.g.loaded_netrw = 1
  --   vim.g.loaded_netrwPlugin = 1
  -- end,
}
