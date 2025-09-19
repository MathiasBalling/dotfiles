return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    table.remove(opts.dashboard.preset.keys, 7) -- removes restore session
    table.insert(opts.dashboard.preset.keys, 7, {
      icon = "",
      key = "s",
      desc = "Select Session",
      action = function()
        require("persistence").select()
      end,
    })

    table.insert(opts.dashboard.preset.keys, 9, {
      icon = "",
      key = "z",
      desc = "Zoxide",
      action = function()
        require("snacks.picker").zoxide()
      end,
    })

    opts = vim.tbl_deep_extend("force", opts, {
      picker = {
        matcher = {
          cwd_bonus = true,
          frecency = true,
          history_bonus = true,
        },
      },
      -- image = {
      --   doc = {
      --     inline = false,
      --   },
      -- },
      dashboard = {
        preset = {
          header = [[
       __ )     \     |      |     _ _|   \  |   ___|   _ \
       __ \    _ \    |      |       |     \ |  |      |   |
       |   |  ___ \   |      |       |   |\  |  |   |  |   |
      ____/ _/    _\ _____| _____| ___| _| \_| \____| \___/
     ]],
          -- ██████╗  █████╗ ██╗     ██╗     ██╗███╗   ██╗ ██████╗  ██████╗
          -- ██╔══██╗██╔══██╗██║     ██║     ██║████╗  ██║██╔════╝ ██╔═══██╗
          -- ██████╔╝███████║██║     ██║     ██║██╔██╗ ██║██║  ███╗██║   ██║
          -- ██╔══██╗██╔══██║██║     ██║     ██║██║╚██╗██║██║   ██║██║   ██║
          -- ██████╔╝██║  ██║███████╗███████╗██║██║ ╚████║╚██████╔╝╚██████╔╝
          -- ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝
        },
      },
    })
    return opts
  end,
}
