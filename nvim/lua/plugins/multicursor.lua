return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    local set = vim.keymap.set
    mc.setup()

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

    -- Multicursor mappings
    set({ "n", "x" }, "<M-c>", "", { desc = "Multicursor" })
    set({ "n", "x" }, "<M-c>k", function()
      mc.lineAddCursor(-1)
    end, { desc = "Add cursor above" })
    set({ "n", "x" }, "<M-c>j", function()
      mc.lineAddCursor(1)
    end, { desc = "Add cursor below" })
    set({ "n", "x" }, "<M-c><S-k>", function()
      mc.lineSkipCursor(-1)
    end, { desc = "Skip cursor above" })
    set({ "n", "x" }, "<M-c><S-j>", function()
      mc.lineSkipCursor(1)
    end, { desc = "Skip cursor below" })
    set({ "n", "x" }, "<M-c>i", function()
      mc.insertVisual()
    end, { desc = "Insert Visual Cursors" })
    set({ "n", "x" }, "<M-c>I", function()
      mc.appendVisual()
    end, { desc = "Append Visual Cursors" })

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, "<M-c>a", function()
      mc.matchAllAddCursors()
    end, { desc = "Add cursor to all matches" })
    set({ "n", "x" }, "<M-c>n", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor to next match", noremap = true })
    set({ "n", "x" }, "<M-c><S-n>", function()
      mc.matchSkipCursor(1)
    end, { desc = "Skip cursor to next match", noremap = true })
    set({ "n", "x" }, "<M-c>p", function()
      mc.matchAddCursor(-1)
    end, { desc = "Add cursor to previous match", noremap = true })
    set({ "n", "x" }, "<M-c><S-p>", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Skip cursor to previous match", noremap = true })
    set({ "n", "x" }, "<M-c>m", function()
      mc.matchCursors()
    end, { desc = "Match with Pattern", noremap = true })
    set({ "n", "x" }, "<M-c>s", function()
      mc.splitCursors()
    end, { desc = "Split with Regex", noremap = true })
    set({ "n", "x" }, "<M-c>u", function()
      mc.searchAddCursor(-1)
    end, { desc = "Add cursor at prev search result", noremap = true })
    set({ "n", "x" }, "<M-c><S-u>", function()
      mc.searchSkipCursor(-1)
    end, { desc = "Skip cursor at prev search result", noremap = true })
    set({ "n", "x" }, "<M-c>d", function()
      mc.searchAddCursor(1)
    end, { desc = "Add cursor at next search result", noremap = true })
    set({ "n", "x" }, "<M-c><S-d>", function()
      mc.searchSkipCursor(1)
    end, { desc = "Skip cursor at next search result", noremap = true })
    set({ "n", "x" }, "<M-c><S-a>", function()
      mc.searchAllAddCursors()
    end, { desc = "Add cursor to all search results", noremap = true })

    -- Disable and enable cursors.
    set({ "n", "x" }, "<M-q>", mc.toggleCursor)

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<M-h>", mc.prevCursor)
      layerSet({ "n", "x" }, "<M-l>", mc.nextCursor)

      -- Delete the main cursor.
      layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor)

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end,
}
