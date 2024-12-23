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

-- Paste the last yanked text
vim.keymap.set({ "n", "v" }, ",p", '"0p', { desc = "Paste last yanked text" })
vim.keymap.set({ "n", "v" }, ",P", '"0P', { desc = "Paste last yanked text" })

-- Copilot
vim.keymap.set("n", "<leader>ce", function()
  if require("copilot.client").is_disabled() then
    require("copilot.command").enable()
  else
    require("copilot.command").disable()
  end
end, { desc = "Toggle Copilot" })

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
