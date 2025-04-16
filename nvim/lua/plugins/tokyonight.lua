return {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 999,
  opts = {
    style = "night",
    -- options will go here
    on_colors = function(colors)
      colors.bg_float = "#000111"
      colors.bg = "#000111"
      colors.bg_popup = "#000111"
      colors.bg_sidebar = "#000111"
      colors.border = "#3d59a1"
      colors.border_highlight = "#589ed7"
    end,
  },
}
