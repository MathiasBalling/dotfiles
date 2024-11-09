-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Save all files
vim.keymap.set("n", "<C-s>", "<cmd>wa<cr>", { desc = "Save all files" })

-- Center screen
vim.keymap.set("n", "n", "nzz", { desc = "Next search (center)" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search (center)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Visual replace
vim.keymap.set("n", "<M-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Visual replace" }) -- Alt + s
vim.keymap.set("v", "<M-s>", [[:s/\v]], { desc = "Replace in selected" }) -- Alt + s

vim.keymap.set("n", "<M-f>", [[:%s/\v]], { desc = "Replace in buffer" }) -- Alt + f
vim.keymap.set("v", "<M-f>", [[:s/\v]], { desc = "Replace in selected" }) -- Alt + f

-- Buffer/window delete
vim.keymap.set("n", "<M-q>", "<cmd>bd<cr>", { desc = "Delete buffer" }) -- Alt + q
vim.keymap.set("n", "<M-w>", "<C-w>q", { desc = "Delete window" }) -- Alt + w

-- Exit insert mode
-- vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- Paste the last yanked text
vim.keymap.set({ "n", "v" }, ",p", '"0p', { desc = "Paste last yanked text" })
vim.keymap.set({ "n", "v" }, ",P", '"0P', { desc = "Paste last yanked text" })

-- Function to toggle conceal level
local function toggle_conceallevel()
  if vim.opt.conceallevel:get() == 1 then
    vim.opt.conceallevel = 0
  else
    vim.opt.conceallevel = 1
  end
end
-- Add function to keymap
vim.keymap.set("n", "<leader>ch", toggle_conceallevel, { desc = "Toggle conceallevel" })

-- Projects
vim.keymap.set("n", "<leader>cp", "<cmd>AddProject<cr>", { desc = "Add to projects" })

-- End of the line
vim.keymap.set("n", "§", "$", { desc = "Go to end of line" })

-- Toogle spell
vim.keymap.set("n", "<leader>cs", "<cmd>set spell!<cr>", { desc = "Toggle spell" })

vim.keymap.set({ "i", "n" }, "<M-t>", function()
  require("lazyvim.util").terminal()
end, { desc = "Open terminal" })

vim.keymap.set({ "t" }, "<M-r>", "<cmd>close<cr>", { desc = "Close terminal" })

-- Spectre search
vim.keymap.set("n", "<leader>rr", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>rw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
vim.keymap.set("v", "<leader>rw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
vim.keymap.set("n", "<leader>rp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- Copilot
vim.keymap.set("n", "<leader>ce", function()
  if require("copilot.client").is_disabled() then
    require("copilot.command").enable()
  else
    require("copilot.command").disable()
  end
end, { desc = "Toggle Copilot" })

-- Toggle lsp inline hint
vim.keymap.set("n", "<leader>ct", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle LSP inline hint" })

-- Execute :Copilot suggestion
vim.keymap.set("n", "<M-g>", function()
  require("copilot.command").execute()
end, { desc = "Execute Copilot suggestion" })

-- Function to run file depending on filetype
vim.keymap.set("n", "<M-r>", function()
  if vim.bo.filetype == "python" then
    vim.cmd("w")
    vim.cmd("split | term python3 %")
  elseif vim.bo.filetype == "cpp" then
    vim.cmd("w")
    vim.cmd("CMakeRun")
  elseif vim.bo.filetype == "rust" then
    vim.cmd("w")
    vim.cmd("Cargo run")
  elseif vim.bo.filetype == "javascript" then
    vim.cmd("w")
    vim.cmd("split | term node %")
  else -- Default
    vim.notify("Not supported filetype", "warn", { title = "File runner" })
  end
end, { desc = "Run file" })
