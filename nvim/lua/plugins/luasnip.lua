return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snippets/luasnip/" } })
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/vscode/" } })
    require("luasnip").config.setup({
      update_events = "TextChanged, TextChangedI",
      enable_autosnippets = true,
    })
  end,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
}
