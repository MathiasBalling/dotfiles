return {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 999,
  opts = {
    style = "moon",
    -- options will go here
    on_colors = function(colors)
      colors.bg_float = "#0b0b0f"
      colors.bg = "#000000"
      -- Change color on the help popup
      colors.bg_popup = "#000000"
      colors.bg_sidebar = "#000011"
    end,

    on_highlights = function(hl, c)
      local background = "#000000"
      hl.TelescopeNormal = {
        bg = background,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = background,
        fg = c.fg_dark,
      }
      hl.NeoTreeNormal = {
        bg = background,
      }
      hl.NeoTreeNormalNC = {
        bg = background,
      }
    end,
  },
}
