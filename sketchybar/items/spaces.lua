local app_icons = require("app_icons")
local colors = require("colors")
local settings = require("settings")

-- Workspace items are created/removed dynamically, because the set of
-- AeroSpace workspaces changes at runtime (e.g. right after login AeroSpace may
-- only have a temporary workspace like "10" before windows are assigned).
local spaces = {} -- workspace name -> sketchybar item
local order = {} -- sorted list of workspace names currently shown

local function compare_workspaces(a, b)
  local na, nb = tonumber(a), tonumber(b)
  if na and nb then
    return na < nb
  elseif na then
    return true
  elseif nb then
    return false
  end
  return a < b
end

local function add_space(workspace)
  local space = sbar.add("item", "item." .. workspace, {
    position = "left",
    icon = {
      font = {
        family = settings.font.numbers,
      },
      string = workspace,
      padding_left = settings.items.padding.left,
      padding_right = 0,
      color = settings.items.default_color(workspace),
      highlight_color = settings.items.highlight_color(workspace),
    },
    label = {
      drawing = false,
      padding_right = settings.items.padding.right,
      color = settings.items.default_color(workspace),
      highlight_color = settings.items.highlight_color(workspace),
      font = settings.apps_font,
    },
    padding_right = 0,
    padding_left = 0,
    background = {
      color = settings.items.colors.background,
      border_width = 1,
      height = settings.items.height,
      border_color = colors.transparent,
    },
  })

  -- Padding space between each item
  sbar.add("item", "item." .. workspace .. "padding", {
    position = "left",
    script = "",
    width = settings.items.gap,
  })

  space:subscribe("mouse.clicked", function(env)
    if env.BUTTON ~= "other" then
      sbar.exec("aerospace workspace '" .. workspace .. "'")
    end
  end)

  spaces[workspace] = space
end

local function remove_space(workspace)
  sbar.remove("item." .. workspace)
  sbar.remove("item." .. workspace .. "padding")
  spaces[workspace] = nil
end

-- Keep the workspace items in sorted order, in front of the active app items.
local function reorder()
  local names = {}
  for _, workspace in ipairs(order) do
    table.insert(names, "item." .. workspace)
    table.insert(names, "item." .. workspace .. "padding")
  end
  table.insert(names, "active_app_spacer")
  table.insert(names, "active_app")
  sbar.exec("sketchybar --reorder " .. table.concat(names, " "))
end

local function update_icons()
  sbar.exec("aerospace list-windows --all --json --format '%{workspace} %{app-name}'", function(windows)
    local icon_lines = {}
    if type(windows) == "table" then
      for _, window in ipairs(windows) do
        local lookup = app_icons[window["app-name"]]
        local icon = (lookup == nil) and app_icons["Default"] or lookup
        icon_lines[window.workspace] = (icon_lines[window.workspace] or "") .. icon
      end
    end

    sbar.animate("tanh", 10, function()
      for workspace, space in pairs(spaces) do
        local icon_line = icon_lines[workspace]
        space:set({
          label = {
            drawing = icon_line ~= nil,
            string = icon_line or "",
          },
          icon = {
            padding_right = icon_line and settings.items.padding.right or 0,
          },
        })
      end
    end)
  end)
end

local function refresh()
  sbar.exec("aerospace list-workspaces --all --format '%{workspace} %{workspace-is-focused}'", function(output)
    if type(output) ~= "string" then
      return
    end

    local current = {}
    local names = {}
    local focused = nil
    for line in output:gmatch("[^\n]+") do
      local workspace, is_focused = line:match("^(%S+)%s+(%S+)$")
      if workspace then
        current[workspace] = true
        table.insert(names, workspace)
        if is_focused == "true" then
          focused = workspace
        end
      end
    end

    -- An empty list means AeroSpace isn't answering yet; keep what we have.
    if #names == 0 then
      return
    end

    local changed = false
    for workspace in pairs(spaces) do
      if not current[workspace] then
        remove_space(workspace)
        changed = true
      end
    end
    for _, workspace in ipairs(names) do
      if not spaces[workspace] then
        add_space(workspace)
        changed = true
      end
    end

    table.sort(names, compare_workspaces)
    order = names
    if changed then
      reorder()
    end

    for workspace, space in pairs(spaces) do
      local active = workspace == focused
      space:set({
        icon = { highlight = active },
        label = { highlight = active },
      })
    end

    update_icons()
  end)
end

sbar.add("event", "aerospace_workspace_change")

local space_window_observer = sbar.add("item", "spaces_observer", {
  drawing = false,
  updates = true,
})

space_window_observer:subscribe({
  "aerospace_workspace_change",
  "space_windows_change",
  "front_app_switched",
  "display_change",
  "system_woke",
}, function(_)
  refresh()
end)

refresh()
