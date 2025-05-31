local settings = require("settings")

sbar.bar({
  topmost = "window",
  height = settings.bar.height,
  color = settings.bar.background,
  padding_right = settings.bar.padding.x,
  padding_left = settings.bar.padding.x,
  sticky = true,
  position = "top",
  shadow = false,
  font_smoothing = false,
})
