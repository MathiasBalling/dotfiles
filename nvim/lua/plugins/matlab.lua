return {
  {
    dir = "~/projects/nvim/matlab.nvim/",
    opts = {
      -- Path to the matlab executable. If `matlab` is already in your $PATH, just leave this.
      matlab_path = "matlab",

      -- Display the matlab splash screen on startup
      splash = false,

      -- A list of any other flags you want to add, when launching matlab
      matlab_flags = {},
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "matlab" } },
  },
}
