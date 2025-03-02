local icons = require "icons"
local active = sbar.add("item", "active_app", {
  position = "left",
  icon = { drawing = false },
  label = { string = "cur" },
})

sbar.exec("aerospace list-windows --focused --format %{app-name}", function(app_name)
  active:set { label = { string = app_name } }
end)

active:subscribe("front_app_switched", function(env)
  local app_name = env.INFO
  active:set { label = { string = app_name } }
end)
