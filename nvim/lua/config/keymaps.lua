-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move Lines
-- ‹(<A-j>)
-- ∆(<A-k>)
vim.keymap.del({ "n", "i", "v" }, "<M-j>")
vim.keymap.del({ "n", "i", "v" }, "<M-k>")

-- Move Lines
vim.keymap.set("n", "‹", "<cmd>m .+1<cr>==", { desc = "Move down", silent = true })
vim.keymap.set("n", "∆", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "∆", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
vim.keymap.set("v", "‹", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
vim.keymap.set("i", "‹", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "∆", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

-- Center screen
vim.keymap.set("n", "n", "nzz", { desc = "Next search (center)" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search (center)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Visual replace
vim.keymap.set("n", "ß", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Visual replace" }) -- Alt + s

-- Buffer delete
vim.keymap.set("n", "°", "<cmd>bd<cr>", { desc = "Delete buffer" }) -- Alt + q

-- Exit insert mode
vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- Paste the last yanked text
vim.keymap.set({ "n", "v" }, ",p", '"0p', { desc = "Paste last yanked text" })
vim.keymap.set({ "n", "v" }, ",P", '"0P', { desc = "Paste last yanked text" })

-- Replace æ and ø
vim.keymap.set({ "n", "v", "i" }, "æ", "{", { desc = "Replace æ with {" })
vim.keymap.set({ "n", "v", "i" }, "ø", "}", { desc = "Replace ø with }" })
vim.keymap.set({ "n", "v", "i" }, "Æ", "[", { desc = "Replace Æ with [" })
vim.keymap.set({ "n", "v", "i" }, "Ø", "]", { desc = "Replace Ø with ]" })
