return {
  "subnut/nvim-ghost.nvim",
  lazy = true,
  enabled = true,
  keys = {
    {
      "<leader>cg",
      function()
        vim.notify("Starting Ghost Text", vim.log.levels.INFO, { title = "Ghost Text" })
      end,
      desc = "Ghost Text Start",
    },
  },
}
