local colors = require("colors")
local icons = require("icons")

local workspaces = {}

local function update_spaces()
  -- Run the command to fetch workspaces
  sbar.exec("aerospace list-workspaces --monitor all --empty no", function(spaces)
    local new_workspaces = {}

    -- Populate new workspaces from command output
    for space_name in spaces:gmatch("[^\r\n]+") do
      new_workspaces[space_name] = true
    end

    -- Remove workspaces that no longer is active
    for space_name in pairs(workspaces) do
      if not new_workspaces[space_name] then
        sbar.remove("space." .. space_name)
        workspaces[space_name] = nil
      end
    end

    -- Add new workspaces
    for space_name in pairs(new_workspaces) do
      if not workspaces[space_name] then
        workspaces[space_name] = true

        local space = sbar.add("item", "space." .. space_name, {
          label = {
            string = space_name,
          },
          icon = icons.space_indicator.off,

          click_script = "aerospace workspace " .. space_name,
          padding_left = space_name == "1" and 0 or 4,
        })

        space:subscribe("aerospace_workspace_change", function(env)
          update_spaces()
          local selected = env.FOCUSED_WORKSPACE == space_name
          space:set({
            label = { color = selected and colors.white or colors.grey },
            icon = {
              color = selected and colors.white or colors.grey,
              string = selected and icons.space_indicator.on or icons.space_indicator.off,
            },
          })
        end)
      end
    end

    local keys = {}
    -- Collect keys from workspaces table
    for k in pairs(workspaces) do
      table.insert(keys, k)
    end
    -- Sort the keys
    table.sort(keys)
    local reorder = ""
    local last_key
    -- Iterate in sorted order
    for _, key in ipairs(keys) do
      reorder = reorder .. " space." .. key
      last_key = "space." .. key
    end
    sbar.exec("sketchybar --reorder" .. reorder)
    sbar.exec("sketchybar --move active_app after " .. last_key)
  end)
end

-- Initial call
update_spaces()

-- Mode indicator
local mode = sbar.add("item", "mode", {
  position = "left",
  icon = {
    drawing = true,
  },
  label = {
    drawing = false,
  },
  update_freq = 1,
})

local function update_mode()
  -- local enabled = enable:query().icon.value
  -- if enable:query().icon.value == icons.switch.off then
  --   return
  -- end

  sbar.exec("aerospace list-modes --current", function(cur_mode)
    cur_mode = cur_mode:gsub("\n", "")
    local mode_icon = icons.aerospace.mode.main
    if cur_mode == "resize" then
      mode_icon = icons.aerospace.mode.resize
    elseif cur_mode == "opener" then
      mode_icon = icons.aerospace.mode.opener
    elseif cur_mode == "service" then
      mode_icon = icons.aerospace.mode.service
    end
    mode:set({ icon = { string = mode_icon } })
  end)
end
-- Initial call
update_mode()

mode:subscribe("routine", function()
  update_mode()
end)
