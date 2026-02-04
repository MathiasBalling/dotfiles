vim.keymap.set("n", "<M-r>", function()
  vim.cmd("w")
  vim.cmd("split | term python3 %")
end, { buffer = true, desc = "Run file" })

vim.keymap.set("n", "<leader>l", "", { buffer = true, silent = true, desc = "Python" })
vim.keymap.set("n", "<leader>lv", "<cmd>VenvSelect<CR>", { buffer = true, silent = true, desc = "Python Venv Select" })

-------------- Jyupynium --------------
-- Before Sync
vim.keymap.set("n", "<leader>lj", "", { buffer = true, silent = true, desc = "Jupynium" })
vim.keymap.set(
  "n",
  "<leader>lja",
  "<cmd>JupyniumStartAndAttachToServer<CR>",
  { buffer = true, silent = true, desc = "Start and Attach to Server" }
)
vim.keymap.set(
  "n",
  "<leader>ljA",
  "<cmd>JupyniumAttachToServer<CR>",
  { buffer = true, silent = true, desc = "Attach to Server" }
)
vim.keymap.set(
  "n",
  "<leader>ljT",
  "<cmd>JupyniumStartAndAttachToServerInTerminal<CR>",
  { buffer = true, silent = true, desc = "Start and Attach to Server (terminal)" }
)

-- After Sync
vim.keymap.set("n", "<leader>ljs", "<cmd>JupyniumStartSync<CR>", { buffer = true, silent = true, desc = "Start Sync" })
vim.keymap.set("n", "<leader>ljS", "<cmd>JupyniumStopSync<CR>", { buffer = true, silent = true, desc = "Stop Sync" })
vim.keymap.set(
  "n",
  "<leader>ljx",
  "<cmd>JupyniumExecuteSelectedCells<CR>",
  { buffer = true, silent = true, desc = "Execute Selected Cells" }
)
vim.keymap.set(
  "n",
  "<leader>ljc",
  "<cmd>JupyniumClearSelectedCellsOutputs<CR>",
  { buffer = true, silent = true, desc = "Clear Selected Cells" }
)
vim.keymap.set(
  "n",
  "<leader>ljT",
  "<cmd>JupyniumKernelOpenInTerminal<CR>",
  { buffer = true, silent = true, desc = "Kernel Open Terminal" }
)
vim.keymap.set(
  "n",
  "<leader>ljr",
  "<cmd>JupyniumKernelRestart<CR>",
  { buffer = true, silent = true, desc = "Kernel Restart" }
)
vim.keymap.set(
  "n",
  "<leader>lji",
  "<cmd>JupyniumKernelInterrupt<CR>",
  { buffer = true, silent = true, desc = "Kernel Interrupt" }
)
vim.keymap.set(
  "n",
  "<leader>ljh",
  "<cmd>JupyniumKernelHover<CR>",
  { buffer = true, silent = true, desc = "Kernel Hover" }
)
vim.keymap.set(
  "n",
  "<leader>ljk",
  "<cmd>JupyniumKernelSelect<CR>",
  { buffer = true, silent = true, desc = "Kernel Select" }
)
vim.keymap.set(
  "n",
  "<leader>ljz",
  "<cmd>JupyniumAutoscrollToggle<CR>",
  { buffer = true, silent = true, desc = "Autoscroll Toggle" }
)
vim.keymap.set(
  "n",
  "<leader>ljZ",
  "<cmd>JupyniumToggleSelectedCellsOutputsScroll<CR>",
  { buffer = true, silent = true, desc = "Cell Output Scroll Toggle" }
)

vim.keymap.set(
  "n",
  "<M-u>",
  "<cmd>:JupyniumScrollUp<CR>",
  { buffer = true, silent = true, desc = "Scroll Up Jupynium" }
)
vim.keymap.set(
  "n",
  "<M-d>",
  "<cmd>:JupyniumScrollDown<CR>",
  { buffer = true, silent = true, desc = "Scroll Down Jupynium" }
)
