vim.keymap.set("n", "<M-r>", function()
  vim.cmd("w")
  vim.cmd("CMakeRun")
end, { desc = "Run file" })
