local icons = require("icons")
local settings = require("settings")
local app_icons = require("app_icons")
local colors = require("colors")

local function capitalize_first(str)
  return (str:gsub("^%l", string.upper))
end

sbar.add("item", "active_app_spacer", {
  position = "left",
  padding_left = settings.paddings,
  padding_right = settings.paddings,

  label = { drawing = false },
  icon = {
    string = icons.active_app,
    font = {
      family = settings.font.text,
      style = "Bold",
      size = 14.0,
    },
    y_offset = 1,
    color = settings.items.highlight_color(0),
  },
  background = {
    color = settings.items.colors.background,
    border_width = 1,
    height = 15,
    border_color = settings.items.highlight_color(0),
  },
})

local active = sbar.add("item", "active_app", {
  padding_left = settings.paddings,
  padding_right = settings.paddings,
  position = "left",
  -- icon = { },
  icon = {
    string = "",
    font = settings.apps_font,
    -- string = app_icons["neovim"],
    -- font = settings.apps_font,
    color = settings.items.highlight_color(0),
    padding_left = settings.items.padding.left,
  },
  label = {
    string = "",
    color = settings.items.highlight_color(0),
    padding_right = settings.items.padding.right,
  },
  background = {
    color = settings.items.colors.background,
    border_width = 1,
    height = settings.items.height,
    border_color = settings.items.highlight_color(0),
  },
})

sbar.exec("aerospace list-windows --focused --format %{app-name}", function(app_name)
  local lookup = app_icons[app_name]
  local icon = ((lookup == nil) and app_icons["default"] or lookup)
  active:set({ label = { string = app_name }, icon = {
    string = icon,
  } })
end)

active:subscribe("front_app_switched", function(env)
  local app_name = env.INFO
  local lookup = app_icons[app_name]
  local icon = ((lookup == nil) and app_icons["default"] or lookup)
  active:set({ label = { string = capitalize_first(app_name) }, icon = {
    string = icon,
  } })
end)
