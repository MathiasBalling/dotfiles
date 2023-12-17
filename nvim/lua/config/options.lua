-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set for tmux navigator
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2

-- Don't use system clipboard
-- vim.g.clipboard = ""

-- VimTex
-- vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_mappings_enabled = 0
vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_compiler_latexmk = {
  build_dir = "build",
  aux_dir = "aux",
  callback = 1,
  continuous = 0,
  options = {
    "-pdf",
    "-verbose",
    "-file-line-error",
    "-synctex=0",
    "-interaction=nonstopmode",
  },
}

-- Set conceallevel
vim.opt.conceallevel = 0

-- Set spell
vim.opt.spell = false
