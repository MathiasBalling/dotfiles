local icons = require("icons")
local settings = require("settings")

local battery = sbar.add("item", {
  position = "right",
  icon = {
    font = {
      style = "Regular",
      size = 19.0,
    },
    color = settings.items.highlight_color(0),
    padding_left = settings.items.padding.left,
  },
  background = {
    color = settings.items.colors.background,
    border_width = 1,
    height = settings.items.height,
    border_color = settings.items.highlight_color(0),
  },
  label = { string = "", color = settings.items.highlight_color(0), padding_right = settings.items.padding.right },
  update_freq = 60,
})

local remaining_time = sbar.add("item", {
  position = "popup." .. battery.name,
  icon = {
    string = "Time left:",
    align = "left",
  },
  label = {
    string = "??:??h",
    align = "right",
  },
  background = { drawing = false },
})

local function battery_update()
  sbar.exec("pmset -g batt", function(batt_info)
    local icon = ""
    local found, _, charge = batt_info:find("(%d+)%%")
    if found then
      charge = tonumber(charge)
    end

    if string.find(batt_info, "AC Power") then
      if string.find(batt_info, "not charging") then
        icon = icons.battery.paused
      else
        icon = icons.battery.charging
      end
    else
      if found and charge > 80 then
        icon = icons.battery._100
      elseif found and charge > 60 then
        icon = icons.battery._75
      elseif found and charge > 40 then
        icon = icons.battery._50
      elseif found and charge > 20 then
        icon = icons.battery._25
      else
        icon = icons.battery._0
      end
    end

    battery:set({ icon = icon })
    battery:set({ label = { string = charge .. "%" } })
  end)
end

local function battery_popup()
  local drawing = battery:query().popup.drawing
  battery:set({ popup = { drawing = "toggle" } })

  if drawing == "off" then
    sbar.exec("pmset -g batt", function(batt_info)
      local found, _, remaining = batt_info:find(" (%d+:%d+) remaining")
      local label = found and remaining .. "h" or "No estimate"
      remaining_time:set({ label = label })
    end)
  end
end

battery:subscribe({ "routine", "power_source_change", "system_woke" }, battery_update)
battery:subscribe({ "mouse.clicked" }, battery_popup)
