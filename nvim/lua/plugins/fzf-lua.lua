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
      "<leader>fC",
      -- Search config files
      function()
        require("fzf-lua").files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Lazy plugins",
    },
  },
}
