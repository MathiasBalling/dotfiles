local set = vim.keymap.set

-- Save all files
set("n", "<C-s>", "<cmd>wa<cr>", { desc = "Save all files" })

-- Center screen
set("n", "n", "nzz", { desc = "Next search (center)" })
set("n", "N", "Nzz", { desc = "Prev search (center)" })

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- Visual replace
set("n", "<M-s>", [[:%s/\v<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Visual replace" }) -- Alt + s
set("v", "<M-s>", [[:s/\v]], { desc = "Replace in selected" }) -- Alt + s

set("n", "<M-f>", [[:%s/\v]], { desc = "Replace in buffer" }) -- Alt + f
set("v", "<M-f>", [[:s/\v]], { desc = "Replace in selected" }) -- Alt + f

set("n", "<M-g>", [[:%g/\v]], { desc = "Global search and action in buffer" }) -- Alt + g
set("v", "<M-g>", [[:g/\v]], { desc = "Global search and action in selection" }) -- Alt + g

-- Paste the last yanked text
set({ "n", "v" }, ",p", '"0p', { desc = "Paste last yanked text" })
set({ "n", "v" }, ",P", '"0P', { desc = "Paste last yanked text" })

-- Escape from terminal
set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Escape from terminal" })

set("n", "<leader>ue", "<cmd>Copilot toggle<cr>", { desc = "Toggle copilot" })

-- Specific keymaps for neovide
if vim.g.neovide then
  set("n", "<D-w>", ":wqa!<CR>", { desc = "Copy", noremap = true, silent = true })
  set("v", "<D-c>", '"+y', { desc = "Copy", noremap = true, silent = true })
  set({ "n", "v" }, "<D-v>", '"+P', { desc = "Paste", noremap = true, silent = true })
  set({ "i", "c" }, "<D-v>", "<C-R>+", { desc = "Paste", noremap = true, silent = true })
  set("t", "<D-v>", '<C-\\><C-o>"+p <BS>', { desc = "Paste in terminal", noremap = true, silent = true })
  set("n", "<leader>fwd", function()
    vim.uv
      .spawn("/opt/homebrew/bin/wezterm", {
        args = { "start", "--cwd", vim.fs.normalize(vim.uv.cwd() or ".") },
        stdio = { nil, nil, nil },
        detached = true,
        env = vim.env,
        cwd = vim.fs.normalize(vim.uv.cwd() or "."),
      })
      :unref()
  end, { desc = "Open cwd in wezterm", noremap = true, silent = true })
  set("n", "<leader>fwf", function()
    local file_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) or "."
    vim.uv
      .spawn("/opt/homebrew/bin/wezterm", {
        args = { "start", "--cwd", vim.fs.normalize(file_dir) },
        stdio = { nil, nil, nil },
        detached = true,
        env = vim.env,
        cwd = vim.fs.normalize(vim.uv.cwd() or "."),
      })
      :unref()
  end, { desc = "Open file dir in wezterm", noremap = true, silent = true })
end
