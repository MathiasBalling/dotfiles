return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        ["<leader>v"] = { name = "+Vimtex" },
      },
    },
  },
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      -- VimTex
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_mappings_enabled = 0
      vim.g.vimtex_imaps_enabled = 0
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        -- aux_dir = "aux",
        callback = 1,
        continuous = 1,
        options = {
          "-pdf",
          "-verbose",
          "-file-line-error",
          "-shell-escape",
          "-synctex=0",
          "-interaction=nonstopmode",
        },
      }
    end,

    keys = {
      { "<leader>l", "", desc = "+vimtex", ft = "tex" },
      { "<leader>lC", "<cmd>VimtexCompile<cr>", desc = "Vimtex Compile", ft = "tex" },
      { "<leader>lc", "<cmd>VimtexCompileSS<cr>", desc = "Vimtex Single Shot Compile", ft = "tex" },
      { "<leader>le", "<cmd>VimtexTocToggle<cr>", desc = "Toggle TOC", ft = "tex" },
      { "<leader>lv", "<cmd>VimtexView<cr>", desc = "View view pdf", ft = "tex" },
      { "<leader>li", "<cmd>VimtexInfo<cr>", desc = "Vimtex info", ft = "tex" },
      { "<leader>ls", "<cmd>VimtexStop<cr>", desc = "Vimtex Stop", ft = "tex" },
      { "<leader>lq", "<cmd>VimtexClean<cr>", desc = "Vimtex Clean", ft = "tex" },
    },
  },
}
