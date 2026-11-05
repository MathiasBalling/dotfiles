-- Mirrors selected macOS menu bar extras into sketchybar.
--
-- Aliases are only images of the real menu bar items, so clicks are forwarded
-- to the real item through the Accessibility API. Which alias belongs to which
-- app is resolved by helpers/menu_items.js (see the comment there for why).
-- Items that ignore the Accessibility press (e.g. BetterDisplay, Control
-- Center) can't be opened this way while the menu bar is auto-hidden.
local settings = require("settings")
local colors = require("colors")

-- Menu bar items, left to right.
--   process: the app's process name; its alias is looked up by position. Find
--     names with: osascript -e 'tell application "System Events" to get name of every process whose visible is false'
--   alias: a fixed alias name, for items with a unique window name (see
--     `sketchybar --query default_menu_items`); display only, no click.
local apps = {
  { process = "Tailscale" },
  { process = "Vorssaint" },
  { process = "PasswordsMenuBarExtra" },
  { process = "AlDente" },
}

local config_dir = os.getenv("CONFIG_DIR") or (os.getenv("HOME") .. "/.config/sketchybar")
local helpers = config_dir .. "/helpers"

local function shell_quote(s)
  return "'" .. s:gsub("'", "'\\''") .. "'"
end

local aliases = {} -- entry id -> alias item name
local retries = 0

local function click_command(app, alias_name)
  if app.process then
    return "osascript -e "
      .. shell_quote(
        'tell application "System Events" to click menu bar item 1 of menu bar 2 of process "' .. app.process .. '"'
      )
  end
end

local function add_alias(app, alias_name)
  local alias = sbar.add("alias", alias_name, {
    position = "right",
    alias = {
      color = settings.items.highlight_color(0),
    },
    padding_left = -8,
    padding_right = -8,
    background = { drawing = false },
  })
  local click = click_command(app, alias_name)
  if click then
    alias:subscribe("mouse.clicked", function(_)
      sbar.exec(click)
    end)
  end
  aliases[app.id] = alias_name
end

for _, app in ipairs(apps) do
  app.id = app.id or app.process
end

local function layout()
  -- Keep the aliases in the configured order (right items are laid out right
  -- to left, so the list is reversed).
  local order = {}
  for i = #apps, 1, -1 do
    local alias_name = aliases[apps[i].id]
    if alias_name then
      table.insert(order, shell_quote(alias_name))
    end
  end
  if #order > 1 then
    sbar.exec("sketchybar --reorder " .. table.concat(order, " "))
  end

  -- Shared background behind the group, like the other items.
  local members = {}
  for _, alias_name in pairs(aliases) do
    table.insert(members, alias_name)
  end
  if #members > 0 then
    sbar.remove("menu_items.bracket")
    sbar.add("bracket", "menu_items.bracket", members, {
      background = {
        color = settings.items.colors.background,
        border_width = 1,
        border_color = colors.transparent,
        height = settings.items.height,
      },
    })
  end
end

local function resolve()
  local processes = {}
  for _, app in ipairs(apps) do
    if app.process and not aliases[app.id] then
      table.insert(processes, shell_quote(app.process))
    end
  end
  if #processes == 0 then
    return
  end

  local resolver = "osascript -l JavaScript " .. shell_quote(helpers .. "/menu_items.js")
  sbar.exec(resolver .. " " .. table.concat(processes, " "), function(output)
    if type(output) == "string" then
      for line in output:gmatch("[^\n]+") do
        local process, alias_name = line:match("^(.-)\t(.+)$")
        if process and not aliases[process] then
          for _, app in ipairs(apps) do
            if app.process == process then
              add_alias(app, alias_name)
            end
          end
        end
      end
    end
    layout()

    -- Apps may still be starting right after login; try again for a while.
    local missing = false
    for _, app in ipairs(apps) do
      if not aliases[app.id] then
        missing = true
      end
    end
    if missing and retries < 12 then
      retries = retries + 1
      sbar.delay(10, resolve)
    end
  end)
end

-- Items with a fixed alias name can be added right away.
for _, app in ipairs(apps) do
  if app.alias then
    add_alias(app, app.alias)
  end
end
layout()
resolve()
