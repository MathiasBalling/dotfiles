-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
augroup CustomCommentString
    autocmd!
    autocmd FileType c,cpp setlocal commentstring=//\ %s
augroup END
]])

-- vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
--   callback = function () vim.lsp.inlay_hint.enable(false) end,
-- })
-- vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
--   callback = function () vim.lsp.inlay_hint.enable() end,
-- })
