return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
    },
    messages = {
      enabled = true, -- enables the Noice messages UI
      view = "mini", -- default view for messages
      view_error = "mini", -- view for errors
      view_warn = "mini", -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = true,
      view = "mini",
    },
    --   views = {
    --     cmdline_popup = {
    --       -- The position of the cmdline window. Can be 'top', 'bottom', 'left' or 'right'
    --       position = {
    --         row = "50%",
    --       },
    --     },
    --     popupmenu = {
    --       -- The position of the popupmenu window. Can be 'top', 'bottom', 'left' or 'right'
    --       position = {
    --         row = "50%",
    --       },
    --     },
    --   },
  },
}
