local colors = require("colors")
local icons = require("icons")

return {
  paddings = 3,
  group_paddings = 5,
  modes = {
    main = {
      icon = icons.rebel,
      color = colors.white,
    },
    service = {
      icon = icons.nuke,
      color = 0xffff9e64,
    },
  },
  bar = {
    height = 30,
    padding = {
      x = 10,
      y = 5,
    },
    background = colors.transparent,
  },
  items = {
    height = 26,
    gap = 3,
    padding = {
      right = 8,
      left = 8,
      top = 0,
      bottom = 0,
    },
    default_color = function(workspace)
      return colors.nv_blue_dark
    end,
    highlight_color = function(workspace)
      -- return colors.fg
      return colors.nv_blue
    end,
    colors = {
      background = colors.bg,
    },
    corner_radius = 6,
  },

  apps_font = "sketchybar-app-font:Regular:16:normal",

  font = {
    text = "JetBrainsMono Nerd Font", -- Used for text
    numbers = "JetBrainsMono Nerd Font", -- Used for numbers
  },
}
