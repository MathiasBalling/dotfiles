-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move lines under to current line
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>0", "^")
vim.keymap.set("n", "<leader>+", "g_")

-- Move while centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to clipboard
     vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- LSP format
vim.keymap.set("n", "ª", vim.lsp.buf.format) --option + a

-- Center on search and scroll
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Quick rename with visual selection
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- tabs control
vim.keymap.set("n", "†", "<cmd>enew<CR>") --option + t
-- vim.keymap.set("n", "†", "<cmd>tabnew<CR>") 

-- Split window
vim.keymap.set("n", "∫", "<cmd>split<CR>") --option + b
vim.keymap.set("n", "√", "<cmd>vsplit<CR>") --option + v

-- Move between splits
vim.keymap.set("n", "«", "<C-w>h") --option + h
vim.keymap.set("n", "‹", "<C-w>j") --option + j
vim.keymap.set("n", "∆", "<C-w>k") --option + k
vim.keymap.set("n", "¬", "<C-w>l") --option + l

-- Close split
vim.keymap.set("n", "°", "<cmd>close<CR>") --option + q

-- Auto save
vim.keymap.set("n", "<leader>w", ":ASToggle<CR>")

-- Toggle quickfix
vim.keymap.set("n", "<leader>q", ":copen<CR>")

-- Cmake build
vim.keymap.set("n", "<leader>cg", ":CMakeGenerate<CR>")
vim.keymap.set("n", "<leader>cb", ":CMakeBuild<CR>")
vim.keymap.set("n", "<leader>cr", ":CMakeClean<CR>")

