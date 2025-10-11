-- Save all files
vim.keymap.set("n", "<C-s>", "<cmd>wa<cr>", { desc = "Save all files" })

-- Center screen
vim.keymap.set("n", "n", "nzz", { desc = "Next search (center)" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search (center)" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Visual replace
vim.keymap.set("n", "<M-s>", [[:%s/\v<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Visual replace" }) -- Alt + s
vim.keymap.set("v", "<M-s>", [[:s/\v]], { desc = "Replace in selected" }) -- Alt + s

vim.keymap.set("n", "<M-f>", [[:%s/\v]], { desc = "Replace in buffer" }) -- Alt + f
vim.keymap.set("v", "<M-f>", [[:s/\v]], { desc = "Replace in selected" }) -- Alt + f

vim.keymap.set("n", "<M-g>", [[:%g/\v]], { desc = "Replace in buffer" }) -- Alt + g
vim.keymap.set("v", "<M-g>", [[:g/\v]], { desc = "Replace in selected" }) -- Alt + g

-- Paste the last yanked text
vim.keymap.set({ "n", "v" }, ",p", '"0p', { desc = "Paste last yanked text" })
vim.keymap.set({ "n", "v" }, ",P", '"0P', { desc = "Paste last yanked text" })

-- Escape from terminal
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Escape from terminal" })

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

-- Change CWD with zoxide
vim.keymap.set("n", "<leader>sz", function()
  require("snacks.picker").zoxide()
end, { desc = "Search zoxide" })

vim.keymap.set("n", "<leader>fp", "", { desc = "Lazy Plugins" })
vim.keymap.set("n", "<leader>fpf", function()
  require("snacks.picker").files({ cwd = require("lazy.core.config").options.root })
end, { desc = "Find Lazy plugins" })
vim.keymap.set("n", "<leader>fpg", function()
  require("snacks.picker").grep({ cwd = require("lazy.core.config").options.root })
end, { desc = "Find Lazy plugins" })

vim.keymap.set("n", "<leader><space>", function()
  require("snacks.picker").files({ cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or ".") })
end, { desc = "Find files (cwd)" })

vim.keymap.set("n", "<leader>ff", function()
  require("snacks.picker").smart({
    multi = { "files", "git_files", "buffers", "recent" },
  })
end, { desc = "Find files (smart)" })

-- LuaSnip
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<M-i>", function()
  ls.expand()
  local blink = require("blink.cmp")
  if blink.is_active() then
    blink.hide()
  end
end, { silent = true, desc = "Expand snippet" })

vim.keymap.set({ "i", "s" }, "<M-l>", function()
  ls.jump(1)
end, { silent = true, desc = "Next jump (snippet)" })

vim.keymap.set({ "i", "s" }, "<M-h>", function()
  ls.jump(-1)
end, { silent = true, desc = "Prev jump (snippet)" })

vim.keymap.set({ "i", "s" }, "<M-n>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true, desc = "Next choice (snippet)" })

vim.keymap.set({ "i", "s" }, "<M-p>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true, desc = "Prev choice (snippet)" })

-- Specific keymaps for neovide
if vim.g.neovide then
  vim.keymap.set("n", "<D-w>", ":wqa!<CR>", { desc = "Copy", noremap = true, silent = true })
  vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy", noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<D-v>", '"+P', { desc = "Paste", noremap = true, silent = true })
  vim.keymap.set({ "i", "c" }, "<D-v>", "<C-R>+", { desc = "Paste", noremap = true, silent = true })
  vim.keymap.set("t", "<D-v>", '<C-\\><C-o>"+p <BS>', { desc = "Paste in terminal", noremap = true, silent = true })
  vim.keymap.set("n", "<leader>fwd", function()
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
  vim.keymap.set("n", "<leader>fwf", function()
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

-- Toogle supermaven
local supermaven_api = require("supermaven-nvim.api")
vim.keymap.set("n", "<leader>cH", function()
  supermaven_api.toggle()
  vim.notify("Supermaven is " .. (supermaven_api.is_running() and "on" or "off"), "info")
end, { desc = "Toggle supermaven" })
