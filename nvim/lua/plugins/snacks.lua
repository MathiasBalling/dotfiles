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
      -- doc = {
      --   inline = false,
      -- },
      -- },
      dashboard = {
        enabled = false,
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
  config = function(_, opts)
    local set = vim.keymap.set
    -- Change CWD with zoxide
    set("n", "<leader>sz", function()
      require("snacks.picker").zoxide()
    end, { desc = "Search zoxide" })

    set("n", "<leader>fp", "", { desc = "Lazy Plugins" })
    set("n", "<leader>fpf", function()
      require("snacks.picker").files({ cwd = require("lazy.core.config").options.root })
    end, { desc = "Find Lazy plugins" })
    set("n", "<leader>fpg", function()
      require("snacks.picker").grep({ cwd = require("lazy.core.config").options.root })
    end, { desc = "Find Lazy plugins" })

    set("n", "<leader><space>", function()
      require("snacks.picker").files({ cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or ".") })
    end, { desc = "Find files (cwd)" })

    set("n", "<leader>ff", function()
      require("snacks.picker").smart({
        multi = { "files", "git_files", "buffers", "recent" },
      })
    end, { desc = "Find files (smart)" })
  end,
}
