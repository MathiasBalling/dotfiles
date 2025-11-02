vim.keymap.set("n", "<leader>lc", ":MatlabClose<CR>", { buffer = true, desc = "Matlab Close" })
vim.keymap.set("n", "<leader>ld", ":MatlabDoc<CR>", { buffer = true, desc = "Matlab Doc" })
vim.keymap.set("n", "<leader>lb", ":MatlabEvalBlock<CR>", { buffer = true, desc = "Matlab Eval Block" })
vim.keymap.set(
  "v",
  "<leader>lv",
  ":MatlabEvalVisual<CR>",
  { buffer = true, desc = "Matlab Eval Visual", silent = true }
)
vim.keymap.set("n", "<leader>lf", ":MatlabEvalFile<CR>", { buffer = true, desc = "Matlab Eval File", silent = true })
vim.keymap.set("n", "<leader>lw", ":MatlabWorkspace<CR>", { buffer = true, desc = "Matlab Workspace" })
