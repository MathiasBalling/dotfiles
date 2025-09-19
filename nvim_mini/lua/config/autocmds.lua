-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Autocommand for reloading the configuration for aerospace.toml with 'aerospace reload-config'
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "aerospace.toml",
  command = "!aerospace reload-config",
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "tmux.conf",
  command = "!tmux source-file %",
})
