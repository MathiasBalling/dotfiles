local icons = require("icons")
local settings = require("settings")
local app_icons = require("app_icons")
local active = sbar.add("item", "active_app", {
  position = "left",
  padding_left = "10",
  -- icon = { },
  icon = {
    string = icons.active_app,
    font = settings.font.text,
    -- string = app_icons["neovim"],
    -- font = settings.apps_font,
    y_offset = -1,
  },
  background = {
    color = settings.items.colors.background,
    border_width = 1,
    height = settings.items.height,
    -- border_color = settings.items.default_color(0),
  },
  label = { string = "cur", padding_left = "10" },
})

sbar.exec("aerospace list-windows --focused --format %{app-name}", function(app_name)
  active:set({ label = { string = app_name } })
end)

active:subscribe("front_app_switched", function(env)
  local app_name = env.INFO
  active:set({ label = { string = app_name } })
end)
