require'toggleterm'.setup {
    direction = 'float',
}
vim.keymap.set("n", "–", "<cmd>ToggleTerm<cr>")
vim.keymap.set("t", "–", "<cmd>ToggleTerm<cr>")