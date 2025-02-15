return {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 999,
  opts = {
    style = "moon",
    -- options will go here
    on_colors = function(colors)
      colors.bg_float = "#0b0b0f"
      colors.bg = "#000111"
      -- Change color on the help popup
      colors.bg_popup = "#000111"
      colors.bg_sidebar = "#000011"
    end,
  },
}
