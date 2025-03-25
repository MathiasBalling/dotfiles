return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at file",
    },
    {
      "<leader>fw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open working directory yazi",
    },
    {
      "<leader>fq",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume yazi",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      change_working_directory = "<c-/>",
      show_help = "<c-?>",
    },
    integrations = {
      grep_in_directory = "snacks.picker",
      grep_in_selected_files = "snacks.picker",
    },
  },
}
