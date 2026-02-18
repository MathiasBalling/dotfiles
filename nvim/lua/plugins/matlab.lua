return {
  {
    "MathiasBalling/matlab.nvim",
    enabled = true,
    lazy = true,
    ft = { "matlab" },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "matlab" } },
  },
}
