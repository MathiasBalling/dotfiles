vim.keymap.set("n", "<M-r>", function()
  vim.cmd("w")
  vim.cmd("source %")
end, { desc = "Run file" })
