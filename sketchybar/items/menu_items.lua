-- Mirrors selected macOS menu bar extras into sketchybar.
--
-- macOS 27 draws every menu bar extra inside a single MenuBarAgent window.
-- SketchyBar finds the items through that window's accessibility tree, crops
-- the capture to each item and forwards clicks to the real item (an alias
-- without a click_script). This needs the MenuBarAgent patch from
-- nix/overlays/sketchybar-macos27.nix (upstream PR FelixKratz/SketchyBar#893)
-- and Accessibility permission for sketchybar.
--
-- An alias named after an app picks that app's first item. List the names with
-- `sketchybar --query default_menu_items` ("<App>,Item-0" or
-- "MenuBarAgent,com.apple.menuextra.<name>" for Apple's own items).
-- Aliases re-find their item on every update, so apps that start after
-- sketchybar show up on their own.
local settings = require("settings")
local colors = require("colors")

-- Menu bar items, left to right.
local apps = {
  "Tailscale",
  "Vorssaint",
  "AlDente",
}

-- Right items are laid out right to left, so add the rightmost one first.
local members = {}
for i = #apps, 1, -1 do
  local alias = sbar.add("alias", apps[i], {
    position = "right",
    alias = {
      color = settings.items.highlight_color(0),
    },
    padding_left = -8,
    padding_right = -8,
    background = { drawing = false },
  })
  table.insert(members, alias.name)
end

-- Shared background behind the group, like the other items.
sbar.add("bracket", "menu_items.bracket", members, {
  background = {
    color = settings.items.colors.background,
    border_width = 1,
    border_color = colors.transparent,
    height = settings.items.height,
  },
})
