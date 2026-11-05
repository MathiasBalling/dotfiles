#!/usr/bin/osascript -l JavaScript
// Resolve macOS menu bar extras to SketchyBar alias names.
//
// On macOS 26 every third-party menu bar extra is a window owned by
// "Control Center" and most are called "Item-0", so they can only be told apart
// by SketchyBar's positional index: "Control Center,Item-0(<n>)", where <n>
// counts menu bar windows from the right. This script finds each requested
// app's status item through the Accessibility API, matches it to its menu bar
// window by position and prints one line per app:
//
//   <process name>\t<alias name>
//
// Usage: osascript -l JavaScript menu_items.js Tailscale AlDente ...
ObjC.import("CoreGraphics");

const MENUBAR_LAYER = 25;

function str(ref) {
  return ref === undefined || ref === null ? undefined : ObjC.unwrap(ref);
}

// Menu bar windows, sorted the same way SketchyBar sorts them (x descending).
function menuBarWindows() {
  const list = ObjC.castRefToObject(
    $.CGWindowListCopyWindowInfo($.kCGWindowListOptionAll, $.kCGNullWindowID),
  );
  const windows = [];
  for (let i = 0; i < list.count; i++) {
    const w = list.objectAtIndex(i);
    if (str(w.objectForKey("kCGWindowLayer")) !== MENUBAR_LAYER) continue;
    const owner = str(w.objectForKey("kCGWindowOwnerName"));
    const name = str(w.objectForKey("kCGWindowName"));
    // SketchyBar skips windows without a name or owner, and the Window Server.
    if (owner === undefined || name === undefined || owner === "Window Server") continue;
    const b = w.objectForKey("kCGWindowBounds");
    windows.push({
      owner,
      name,
      x: str(b.objectForKey("X")),
      width: str(b.objectForKey("Width")),
    });
  }
  // SketchyBar uses a selection sort on x (descending); keep it stable.
  windows.forEach((w, i) => (w.order = i));
  windows.sort((a, b) => b.x - a.x || a.order - b.order);
  return windows;
}

function run(argv) {
  const windows = menuBarWindows();
  const events = Application("System Events");
  const lines = [];

  for (const proc of argv) {
    try {
      const item = events.processes.byName(proc).menuBars[1].menuBarItems[0];
      const [x] = item.position();
      const [width] = item.size();
      const center = x + width / 2;
      const index = windows.findIndex(
        (w) => center >= w.x && center <= w.x + w.width,
      );
      if (index === -1) continue;
      const w = windows[index];
      lines.push(`${proc}\t${w.owner},${w.name}(${index + 1})`);
    } catch (e) {
      // App not running or it has no menu bar extra: skip it.
    }
  }
  return lines.join("\n");
}
