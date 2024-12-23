return {
  {
    "Civitasv/cmake-tools.nvim",
    keys = {
      { "<leader>cc", "", desc = "+cmake", ft = { "cpp", "cmake" } },
      -- Main actions
      { "<leader>ccg", ":CMakeGenerate<CR>", desc = "Generate CMake files", silent = true, ft = { "cpp", "cmake" } },
      { "<leader>ccb", ":CMakeBuild<CR>", desc = "Build CMake Target", silent = true, ft = { "cpp", "cmake" } },
      { "<M-b>", ":CMakeBuild<CR>", desc = "Build CMake Target", silent = true, ft = { "cpp", "cmake" } }, -- Option + b
      { "<leader>ccB", ":CMakeQuickBuild<CR>", desc = "CMake Quick Build", silent = true, ft = { "cpp", "cmake" } },
      { "<leader>ccr", ":CMakeRun<CR>", desc = "CMake Run Target", silent = true, ft = { "cpp", "cmake" } },
      -- { "<M-r>", ":CMakeRun<CR>", desc = "CMake Run Target", silent = true }, -- Option + r
      { "<leader>ccR", ":CMakeQuickRun<CR>", desc = "CMake Quick Run", silent = true, ft = { "cpp", "cmake" } },

      -- Target actions
      {
        "<leader>cct",
        ":CMakeSelectBuildTarget<CR>",
        desc = "CMake Set Build Target",
        silent = true,
        ft = { "cpp", "cmake" },
      },
      {
        "<leader>ccT",
        ":CMakeSelectBuildType<CR>",
        desc = "CMake Build Type",
        silent = true,
        ft = { "cpp", "cmake" },
      },
      {
        "<leader>ccl",
        ":CMakeSelectLaunchTarget<CR>",
        desc = "CMake Set Launch Target",
        silent = true,
        ft = { "cpp", "cmake" },
      },
      { "<leader>ccL", ":CMakeLaunchArgs ", desc = "CMake Launch Args", ft = { "cpp", "cmake" } },
      {
        "<leader>cco",
        ":CMakeShowTargetFiles<CR>",
        desc = "Show CMake Files",
        silent = true,
        ft = { "cpp", "cmake" },
      },

      -- Debug
      { "<leader>ccd", ":CMakeDebug<CR>", desc = "CMake Debug Target", silent = true, ft = { "cpp", "cmake" } },
      { "<leader>ccD", ":CMakeQuickDebug<CR>", desc = "CMake Quick Debug", silent = true, ft = { "cpp", "cmake" } },

      -- Settings
      { "<leader>ccq", ":CMakeClose<CR>", desc = "Close CMake", silent = true, ft = { "cpp", "cmake" } },
      { "<M-c>", ":CMakeClose<CR>", desc = "Close CMake", silent = true, ft = { "cpp", "cmake" } },
      { "<leader>ccc", ":CMakeClean<CR>", desc = "Clean CMake files", silent = true, ft = { "cpp", "cmake" } },
      {
        "<leader>ccs",
        ":CMakeTargetSettings<CR>",
        desc = "CMake Target Settings",
        silent = true,
        ft = { "cpp", "cmake" },
      },
      { "<leader>ccS", ":CMakeSettings<CR>", desc = "CMake Settings", silent = true, ft = { "cpp", "cmake" } },
      { "<leader>ccw", ":CMakeSelectCwd<CR>", desc = "CMake CWD", silent = true, ft = { "cpp", "cmake" } },
    },
  },
}
