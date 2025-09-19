-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable mouse
vim.opt.mouse = ""

-- Set for tmux navigator
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2

-- Don't use system clipboard
-- vim.g.clipboard = ""

-- Set conceallevel
-- vim.opt.conceallevel = 0

-- Set spell
vim.opt.spell = false
-- vim.opt.wrap = true
-- vim.opt.linebreak = true

vim.g.autoformat = true

-- Local config
vim.opt.exrc = true

-- LazyVim settings
vim.g.snacks_animate = false
vim.g.minipairs_disable = true

-- Undotree
vim.g.undotree_WindowLayout = 2
vim.g.undotree_SetFocusWhenToggle = 1

if vim.g.neovide then
  vim.g.neovide_position_animation_length = 0.05
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0
  -- vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_cursor_animate_command_line = false
  -- vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_input_macos_option_key_is_meta = "both"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_padding_bottom = 30
end
