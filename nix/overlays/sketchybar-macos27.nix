# TEMPORARY: SketchyBar aliases on macOS 27.
#
# macOS 27 draws every menu bar extra inside one MenuBarAgent window, so
# SketchyBar 2.24.1 can no longer find or capture individual items. This applies
# the unmerged upstream fix, FelixKratz/SketchyBar#893 (commit b9f57b7e, the
# diff vendored in ./patches). It also needs Accessibility permission for
# sketchybar.
#
# sketchybar-menubaragent-reveal-shield.patch is a local fix on top of #893: it
# skips the empty MenuBarRevealShield window that MenuBarAgent adds when the menu
# bar auto-hides (otherwise no items are found) and takes the window id from
# the AX window instead of matching bounds, which are the same for several
# MenuBarAgent windows. Check whether upstream fixed this before dropping it.
#
# sketchybar-pr892-menubar-reveal-clicks.patch is the unmerged upstream PR
# FelixKratz/SketchyBar#892 (commit 527f407d): with an auto-hidden menu bar,
# that same MenuBarRevealShield window sits above the bar and swallows clicks
# (they reveal the menu bar instead). It lifts the bar above it while the menu
# bar is hidden.
#
# Remove this overlay (and its import in nix/modules/shared/default.nix) once a
# release that includes the fixes lands in nixpkgs.
final: prev: {
  sketchybar = prev.sketchybar.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      ./patches/sketchybar-pr893-menubaragent.patch
      ./patches/sketchybar-menubaragent-reveal-shield.patch
      ./patches/sketchybar-pr892-menubar-reveal-clicks.patch
    ];
  });
}
