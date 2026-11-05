local settings = require("settings")
local colors = require("colors")
local cal = sbar.add("item", {
  icon = { string = "", color = settings.items.highlight_color(0), padding_left = settings.items.padding.left },
  label = {
    align = "center",
    color = settings.items.highlight_color(0),
    padding_right = settings.items.padding.right,
  },
  background = {
    color = settings.items.colors.background,
    border_width = 1,
    height = settings.items.height,
    -- border_color = settings.items.highlight_color(0),
    border_color = colors.transparent,
  },
  position = "right",
  update_freq = 15,
  -- Keep clear of the camera/microphone privacy dot at the screen edge.
  padding_right = 16,
})

local function update()
  local date = os.date("%d. %b")
  local time = os.date("%H:%M")
  cal:set({ label = date .. " " .. time })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
