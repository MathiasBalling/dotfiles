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

set("n", "<M-g>", [[:%g/\v]], { desc = "Replace in buffer" }) -- Alt + g
set("v", "<M-g>", [[:g/\v]], { desc = "Replace in selected" }) -- Alt + g

-- Paste the last yanked text
set({ "n", "v" }, ",p", '"0p', { desc = "Paste last yanked text" })
set({ "n", "v" }, ",P", '"0P', { desc = "Paste last yanked text" })

-- Escape from terminal
set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Escape from terminal" })

-- Function to run file depending on filetype
set("n", "<M-r>", function()
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
set("n", "<leader>sz", function()
  require("snacks.picker").zoxide()
end, { desc = "Search zoxide" })

set("n", "<leader>fp", "", { desc = "Lazy Plugins" })
set("n", "<leader>fpf", function()
  require("snacks.picker").files({ cwd = require("lazy.core.config").options.root })
end, { desc = "Find Lazy plugins" })
set("n", "<leader>fpg", function()
  require("snacks.picker").grep({ cwd = require("lazy.core.config").options.root })
end, { desc = "Find Lazy plugins" })

set("n", "<leader><space>", function()
  require("snacks.picker").files({ cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or ".") })
end, { desc = "Find files (cwd)" })

set("n", "<leader>ff", function()
  require("snacks.picker").smart({
    multi = { "files", "git_files", "buffers", "recent" },
  })
end, { desc = "Find files (smart)" })

-- LuaSnip
local ls = require("luasnip")
set({ "i" }, "<M-i>", function()
  ls.expand()
  local blink = require("blink.cmp")
  if blink.is_active() then
    blink.hide()
  end
end, { silent = true, desc = "Expand snippet" })

set({ "i", "s" }, "<M-S-l>", function()
  ls.jump(1)
end, { silent = true, desc = "Next jump (snippet)" })

set({ "i", "s" }, "<M-S-h>", function()
  ls.jump(-1)
end, { silent = true, desc = "Prev jump (snippet)" })

set({ "i", "s" }, "<M-n>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true, desc = "Next choice (snippet)" })

set({ "i", "s" }, "<M-p>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true, desc = "Prev choice (snippet)" })

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

-- Multicursor mappings
local mc = require("multicursor-nvim")
set({ "n", "x" }, "<M-c>", "", { desc = "Multicursor" })
set({ "n", "x" }, "<M-c>k", function()
  mc.lineAddCursor(-1)
end, { desc = "Add cursor above" })
set({ "n", "x" }, "<M-c>j", function()
  mc.lineAddCursor(1)
end, { desc = "Add cursor below" })
set({ "n", "x" }, "<M-c><S-k>", function()
  mc.lineSkipCursor(-1)
end, { desc = "Skip cursor above" })
set({ "n", "x" }, "<M-c><S-j>", function()
  mc.lineSkipCursor(1)
end, { desc = "Skip cursor below" })
set({ "n", "x" }, "<M-c>i", function()
  mc.insertVisual()
end, { desc = "Insert Visual Cursors" })
set({ "n", "x" }, "<M-c>I", function()
  mc.appendVisual()
end, { desc = "Append Visual Cursors" })

-- Add or skip adding a new cursor by matching word/selection
set({ "n", "x" }, "<M-c>a", function()
  mc.matchAllAddCursors()
end, { desc = "Add cursor to all matches" })
set({ "n", "x" }, "<M-c>n", function()
  mc.matchAddCursor(1)
end, { desc = "Add cursor to next match", noremap = true })
set({ "n", "x" }, "<M-c><S-n>", function()
  mc.matchSkipCursor(1)
end, { desc = "Skip cursor to next match", noremap = true })
set({ "n", "x" }, "<M-c>p", function()
  mc.matchAddCursor(-1)
end, { desc = "Add cursor to previous match", noremap = true })
set({ "n", "x" }, "<M-c><S-p>", function()
  mc.matchSkipCursor(-1)
end, { desc = "Skip cursor to previous match", noremap = true })
set({ "n", "x" }, "<M-c>m", function()
  mc.matchCursors()
end, { desc = "Match with Pattern", noremap = true })
set({ "n", "x" }, "<M-c>s", function()
  mc.splitCursors()
end, { desc = "Split with Regex", noremap = true })
set({ "n", "x" }, "<M-c>u", function()
  mc.searchAddCursor(-1)
end, { desc = "Add cursor at prev search result", noremap = true })
set({ "n", "x" }, "<M-c><S-u>", function()
  mc.searchSkipCursor(-1)
end, { desc = "Skip cursor at prev search result", noremap = true })
set({ "n", "x" }, "<M-c>d", function()
  mc.searchAddCursor(1)
end, { desc = "Add cursor at next search result", noremap = true })
set({ "n", "x" }, "<M-c><S-d>", function()
  mc.searchSkipCursor(1)
end, { desc = "Skip cursor at next search result", noremap = true })
set({ "n", "x" }, "<M-c><S-a>", function()
  mc.searchAllAddCursors()
end, { desc = "Add cursor to all search results", noremap = true })

-- Disable and enable cursors.
set({ "n", "x" }, "<M-q>", mc.toggleCursor)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
  -- Select a different cursor as the main one.
  layerSet({ "n", "x" }, "<M-h>", mc.prevCursor)
  layerSet({ "n", "x" }, "<M-l>", mc.nextCursor)

  -- Delete the main cursor.
  layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor)

  -- Enable and clear cursors using escape.
  layerSet("n", "<esc>", function()
    if not mc.cursorsEnabled() then
      mc.enableCursors()
    else
      mc.clearCursors()
    end
  end)
end)
