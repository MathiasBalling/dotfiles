return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>v"] = { name = "+Vimtex" },
      },
    },
  },
  {
    "lervag/vimtex",
    lazy = false,
    keys = {
      { "<leader>vc", "<cmd>VimtexCompile<cr>", desc = "Vimtex Compile" },
      { "<leader>vC", "<cmd>VimtexCompileSS<cr>", desc = "Vimtex Single Shot Compile" },
      { "<leader>ve", "<cmd>VimtexTocToggle<cr>", desc = "Toggle TOC" },
      { "<leader>vv", "<cmd>VimtexView<cr>", desc = "View view pdf" },
      { "<leader>vi", "<cmd>VimtexInfo<cr>", desc = "Vimtex info" },
      { "<leader>vs", "<cmd>VimtexStop<cr>", desc = "Vimtex Stop" },
    },
  },
}
