vim.keymap.set("n", "<leader>l", "", { buffer = true, desc = "Typst", silent = true })
vim.keymap.set("n", "<leader>lv", ":TypstPreview document<CR>", { buffer = true, desc = "Preview File", silent = true })
vim.keymap.set(
  "n",
  "<leader>lV",
  ":TypstPreview slide<CR>",
  { buffer = true, desc = "Preview File (Slide)", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>lt",
  ":TypstPreviewToggle<CR>",
  { buffer = true, desc = "Toggle Previewer", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>lc",
  ":TypstPreviewFollowCursorToggle<CR>",
  { buffer = true, desc = "Toggle Follow Cursor", silent = true }
)
vim.keymap.set("n", "<leader>ls", ":TypstPreviewSyncCursor<CR>", { buffer = true, desc = "Sync Cursor", silent = true })

-- Tinymist
vim.keymap.set("n", "<leader>lp", ":LspTinymistPinMain<CR>", { buffer = true, desc = "Pin Main File", silent = true })
vim.keymap.set("n", "<leader>lx", "", { buffer = true, desc = "Export Typst", silent = true })
vim.keymap.set("n", "<leader>lxp", ":LspTinymistExportPdf<CR>", { buffer = true, desc = "Export PDF", silent = true })
vim.keymap.set("n", "<leader>lxs", ":LspTinymistExportSvg<CR>", { buffer = true, desc = "Export SVG", silent = true })
vim.keymap.set(
  "n",
  "<leader>lxi",
  ":LspTinymistExportPng<CR>",
  { buffer = true, desc = "Export Image (PNG)", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>lxm",
  ":LspTinymistExportMarkdown<CR>",
  { buffer = true, desc = "Export Markdown", silent = true }
)
vim.keymap.set("n", "<leader>lxt", ":LspTinymistExportText<CR>", { buffer = true, desc = "Export Text", silent = true })
