local app_icons = require("app_icons")
local colors = require("colors")
local settings = require("settings")

local spaces_bracket = {}

local spaces = {}

local workspaces = GetWorkspaces()
local current_workspace = GetCurrentWorkspace()

local function split(str, sep)
  local result = {}
  local regex = ("([^%s]+)"):format(sep)
  for each in str:gmatch(regex) do
    table.insert(result, each)
  end
  return result
end

for i, workspace in ipairs(workspaces) do
  local selected = workspace == current_workspace
  local space = sbar.add("item", "item." .. workspace, {
    icon = {
      font = {
        family = settings.font.numbers,
      },
      string = workspace,
      padding_left = settings.items.padding.left,
      -- padding_right = settings.items.padding.right,
      padding_right = 0,
      color = settings.items.default_color(i),
      highlight_color = settings.items.highlight_color(i),
      highlight = selected,
    },
    label = {
      padding_right = settings.items.padding.right,
      color = settings.items.default_color(i),
      highlight_color = settings.items.highlight_color(i),
      font = settings.apps_font,
      highlight = selected,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = settings.items.colors.background,
      border_width = 1,
      height = settings.items.height,
      border_color = selected and settings.items.highlight_color(i) or settings.items.default_color(i),
    },
    popup = {
      background = {
        border_width = 5,
        border_color = colors.black,
      },
    },
  })

  spaces[i] = space

  -- Define the icons for open apps on each space initially
  sbar.exec("aerospace list-windows --workspace " .. workspace .. " --format '%{app-name}' --json ", function(apps)
    local icon_line = ""
    local no_app = true
    for _, app in ipairs(apps) do
      no_app = false
      local app_name = app["app-name"]
      local lookup = app_icons[app_name]
      local icon = ((lookup == nil) and app_icons["default"] or lookup)
      icon_line = icon_line .. " " .. icon
    end

    sbar.animate("tanh", 10, function()
      space:set({
        label = {
          drawing = not no_app,
          string = icon_line,
        },
        icon = {
          padding_right = settings.items.padding.right,
        },
      })
    end)
  end)

  -- Padding space between each item
  sbar.add("item", "item." .. workspace .. "padding", {
    script = "",
    width = settings.items.gap,
  })

  space:subscribe("aerospace_workspace_change", function(env)
    local active = env.FOCUSED_WORKSPACE == workspace
    space:set({
      icon = {
        highlight = active,
      },
      label = {
        highlight = active,
      },
      background = {
        border_color = active and settings.items.highlight_color(i) or settings.items.default_color(i),
      },
    })
  end)

  space:subscribe("mouse.clicked", function(env)
    local id = split(env.NAME, ".")[2]
    if env.BUTTON ~= "other" then
      sbar.exec("aerospace workspace " .. id)
    end
  end)
end

local space_window_observer = sbar.add("item", {
  drawing = false,
  updates = true,
})

-- local space_names = {}
-- for _, space in ipairs(spaces) do
--   table.insert(space_names, space.name)
-- end
-- sbar.add("bracket", "test.testing", space_names, {
--   color = settings.items.highlight_color(0),
--   background = {
--     color = settings.items.colors.background,
--     border_width = 1,
--     height = settings.items.height + 2,
--     border_color = settings.items.highlight_color(0),
--   },
-- })

-- Event handles
space_window_observer:subscribe(
  { "front_app_switched", "aerospace_workspace_change", "space_windows_change" },
  function(_)
    for i, workspace in ipairs(workspaces) do
      sbar.exec("aerospace list-windows --workspace " .. workspace .. " --format '%{app-name}' --json ", function(apps)
        local icon_line = ""
        local no_app = true
        for _, app in ipairs(apps) do
          no_app = false
          local app_name = app["app-name"]
          local lookup = app_icons[app_name]
          local icon = ((lookup == nil) and app_icons["default"] or lookup)
          icon_line = icon_line .. "" .. icon
        end

        sbar.animate("tanh", 10, function()
          spaces[i]:set({
            label = {
              drawing = not no_app,
              string = icon_line,
            },
          })
        end)
      end)
    end
  end
)
