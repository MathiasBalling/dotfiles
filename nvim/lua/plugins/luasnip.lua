return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snippets/" } })
    require("luasnip.loaders.from_vscode").lazy_load()
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/vscode/" } })
    ls.config.setup({
      update_events = "TextChanged, TextChangedI",
      enable_autosnippets = true,
    })

    local set = vim.keymap.set

    -- LuaSnip
    set({ "i" }, "<M-i>", function()
      ls.expand()
      local blink = require("blink.cmp")
      if blink.is_active() then
        blink.hide()
      end
    end, { silent = true, desc = "Expand snippet" })

    set({ "i", "s" }, "<M-S-l>", function()
      ls.jump(1)
    end, { silent = true, desc = "Next jump (snippet)" })

    set({ "i", "s" }, "<M-S-h>", function()
      ls.jump(-1)
    end, { silent = true, desc = "Prev jump (snippet)" })

    set({ "i", "s" }, "<M-n>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true, desc = "Next choice (snippet)" })

    set({ "i", "s" }, "<M-p>", function()
      if ls.choice_active() then
        ls.change_choice(-1)
      end
    end, { silent = true, desc = "Prev choice (snippet)" })
  end,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
}
