vim.keymap.set("n", "<leader>cD", ":RustLsp openDocs<CR>", { buffer = true, desc = "Open docs for symbol" })
vim.keymap.set("n", "<leader>cE", ":RustLsp relatedDiagnostics<CR>", { buffer = true, desc = "Related diagnostics" })
vim.keymap.set("n", "<leader>ce", ":RustLsp explainError<CR>", { buffer = true, desc = "Explain error" })
vim.keymap.set("n", "<leader>cM", ":RustLsp expandMacro<CR>", { buffer = true, desc = "Expand macro" })
