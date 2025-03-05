local icons = require("icons")
local active = sbar.add("item", "active_app", {
  position = "left",
  padding_left = "10",
  icon = { string = icons.active_app },
  label = { string = "cur", padding_left = "10" },
})

sbar.exec("aerospace list-windows --focused --format %{app-name}", function(app_name)
  active:set({ label = { string = app_name } })
end)

active:subscribe("front_app_switched", function(env)
  local app_name = env.INFO
  active:set({ label = { string = app_name } })
end)
