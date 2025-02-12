return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>sz",
      -- Zoxide
      function()
        require("fzf-lua").zoxide()
      end,
      desc = "Find File",
    },
    {
      "<leader>sp",
      -- Complete path from working dir
      function()
        require("fzf-lua").complete_path()
      end,
      desc = "Complete path from working dir",
    },
    {
      "<leader>fpf",
      -- Search config files
      function()
        require("fzf-lua").files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find config files",
    },
    {
      "<leader>fpg",
      -- Search config files
      function()
        require("fzf-lua").live_grep({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Grep Lazy plugins",
    },
  },
}
