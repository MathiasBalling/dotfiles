return {
  {
    "Civitasv/cmake-tools.nvim",
    config = function()
      local filetypes = { "c", "cpp", "cmake", "h", "hpp" }

      -- Function to set keymaps
      local function set_cmake_keymaps(bufnr)
        local set = vim.api.nvim_buf_set_keymap
        local opts = { noremap = true, silent = true }

        -- Define all keymaps here
        set(bufnr, "n", "<leader>l", "", { desc = "+cmake" })
        -- Main actions
        set(bufnr, "n", "<leader>lg", ":CMakeGenerate<CR>", opts)
        set(bufnr, "n", "<leader>lb", ":CMakeBuild<CR>", opts)
        set(bufnr, "n", "<leader>lB", ":CMakeQuickBuild<CR>", opts)
        set(bufnr, "n", "<leader>lr", ":CMakeRun<CR>", opts)
        set(bufnr, "n", "<leader>lR", ":CMakeQuickRun<CR>", opts)

        -- Target actions
        set(bufnr, "n", "<leader>lt", ":CMakeSelectBuildTarget<CR>", opts)
        set(bufnr, "n", "<leader>lT", ":CMakeSelectBuildType<CR>", opts)
        set(bufnr, "n", "<leader>ll", ":CMakeSelectLaunchTarget<CR>", opts)
        set(bufnr, "n", "<leader>lL", ":CMakeLaunchArgs<CR>", opts)
        set(bufnr, "n", "<leader>lo", ":CMakeShowTargetFiles<CR>", opts)

        -- Debug
        set(bufnr, "n", "<leader>ld", ":CMakeDebug<CR>", opts)
        set(bufnr, "n", "<leader>lD", ":CMakeQuickDebug<CR>", opts)

        -- Settings
        set(bufnr, "n", "<leader>lq", ":CMakeClose<CR>", opts)
        set(bufnr, "n", "<leader>lc", ":CMakeClean<CR>", opts)
        set(bufnr, "n", "<leader>ls", ":CMakeTargetSettings<CR>", opts)
        set(bufnr, "n", "<leader>lS", ":CMakeSettings<CR>", opts)
        set(bufnr, "n", "<leader>lw", ":CMakeSelectCwd<CR>", opts)
      end

      -- Apply keymaps for the specified filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function(args)
          set_cmake_keymaps(args.buf)
        end,
      })
    end,
  },
}
