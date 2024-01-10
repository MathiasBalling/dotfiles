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
    config = function()
      -- VimTex
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_mappings_enabled = 0
      vim.g.vimtex_imaps_enabled = 0
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        aux_dir = "aux",
        callback = 1,
        continuous = 1,
        options = {
          "-pdf",
          "-verbose",
          "-file-line-error",
          "-synctex=0",
          "-interaction=nonstopmode",
        },
      }
    end,

    keys = {
      { "<leader>vC", "<cmd>VimtexCompile<cr>", desc = "Vimtex Compile" },
      { "<leader>vc", "<cmd>VimtexCompileSS<cr>", desc = "Vimtex Single Shot Compile" },
      { "<leader>ve", "<cmd>VimtexTocToggle<cr>", desc = "Toggle TOC" },
      { "<leader>vv", "<cmd>VimtexView<cr>", desc = "View view pdf" },
      { "<leader>vi", "<cmd>VimtexInfo<cr>", desc = "Vimtex info" },
      { "<leader>vs", "<cmd>VimtexStop<cr>", desc = "Vimtex Stop" },
    },
  },
}
