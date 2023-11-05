local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup {
    extensions = {
        project = {
            hidden_files = false,
        }
    },
}
-- File exproler
vim.keymap.set("n", "<leader>pv", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
vim.keymap.set("n", "<leader>pd", ":Telescope project<CR>", { noremap = true })

vim.keymap.set("n", "<leader>pb", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>bi", ":Telescope builtin<CR>", { noremap = true })

-- Git
vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gc", ":Telescope git_bcommits<CR>", { noremap = true })

require("telescope").load_extension "file_browser"
require 'telescope'.load_extension('project')
