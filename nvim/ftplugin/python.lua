vim.keymap.set("n", "<M-r>", function()
  vim.cmd("w")
  vim.cmd("split | term python3 %")
end, { desc = "Run file" })
