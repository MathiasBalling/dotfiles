return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        ["<leader>cc"] = { name = "+CMake" },
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    keys = {
      -- Main actions
      { "<leader>ccg", ":CMakeGenerate<CR>", desc = "Generate CMake files", silent = true },
      { "<leader>ccb", ":CMakeBuild<CR>", desc = "Build CMake Target", silent = true },
      { "<M-b>", ":CMakeBuild<CR>", desc = "Build CMake Target", silent = true }, -- Option + b
      { "<leader>ccB", ":CMakeQuickBuild<CR>", desc = "CMake Quick Build", silent = true },
      { "<leader>ccr", ":CMakeRun<CR>", desc = "CMake Run Target", silent = true },
      -- { "<M-r>", ":CMakeRun<CR>", desc = "CMake Run Target", silent = true }, -- Option + r
      { "<leader>ccR", ":CMakeQuickRun<CR>", desc = "CMake Quick Run", silent = true },

      -- Target actions
      { "<leader>cct", ":CMakeSelectBuildTarget<CR>", desc = "CMake Set Build Target", silent = true },
      { "<leader>ccT", ":CMakeSelectBuildType<CR>", desc = "CMake Build Type", silent = true },
      { "<leader>ccl", ":CMakeSelectLaunchTarget<CR>", desc = "CMake Set Launch Target", silent = true },
      { "<leader>ccL", ":CMakeLaunchArgs ", desc = "CMake Launch Args" },
      { "<leader>cco", ":CMakeShowTargetFiles<CR>", desc = "Show CMake Files", silent = true },

      -- Debug
      { "<leader>ccd", ":CMakeDebug<CR>", desc = "CMake Debug Target", silent = true },
      { "<leader>ccD", ":CMakeQuickDebug<CR>", desc = "CMake Quick Debug", silent = true },

      -- Settings
      { "<leader>ccq", ":CMakeClose<CR>", desc = "Close CMake", silent = true },
      { "<M-c>", ":CMakeClose<CR>", desc = "Close CMake", silent = true },
      { "<leader>ccc", ":CMakeClean<CR>", desc = "Clean CMake files", silent = true },
      { "<leader>ccs", ":CMakeTargetSettings<CR>", desc = "CMake Target Settings", silent = true },
      { "<leader>ccS", ":CMakeSettings<CR>", desc = "CMake Settings", silent = true },
      { "<leader>ccw", ":CMakeSelectCwd<CR>", desc = "CMake Build Type", silent = true },
    },
  },
}
