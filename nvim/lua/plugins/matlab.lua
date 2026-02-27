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
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        matlab_ls = {
          settings = {
            MATLAB = {
              indexWorkspace = true,
              installPath = "/Applications/MATLAB_R2024b.app/",
              matlabConnectionTiming = "onStart",
              telemetry = true,
            },
          },
        },
      },
    },
  },
}
