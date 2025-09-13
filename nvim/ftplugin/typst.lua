vim.keymap.set("n", "<leader>lv", ":TypstPreview<CR>", { buffer = true, desc = "Preview Typst file", silent = true })
vim.keymap.set(
  "n",
  "<leader>lt",
  ":TypstPreviewToggle<CR>",
  { buffer = true, desc = "Toggle Typst Previewer", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>ls",
  ":TypstPreviewSyncCursor<CR>",
  { buffer = true, desc = "Sync Typst Cursor", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>lf",
  ":TypstPreviewFollowCursorToggle<CR>",
  { buffer = true, desc = "Toggle Follow Cursor Typst Previewer", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>lu",
  ":TypstPreviewUpdate<CR>",
  { buffer = true, desc = "Update Typst Previewer", silent = true }
)
