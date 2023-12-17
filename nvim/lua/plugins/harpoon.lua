return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+Harpoon" },
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon"):setup({})
      -- Harpoon
      local list = require("harpoon"):list()

      vim.keymap.set("n", "<leader>ha", function()
        list:append()
      end, { desc = "Mark file with harpoon" })

      vim.keymap.set("n", "<M-a>", function()
        list:append()
      end, { desc = "Mark file with harpoon" })

      vim.keymap.set("n", "<M-o>", function()
        list:prev()
      end, { noremap = true, desc = "Previous harpoon mark" })

      vim.keymap.set("n", "<M-p>", function()
        list:next()
      end, { noremap = true, desc = "Next harpoon mark" })

      vim.keymap.set("n", "<leader>hm", function()
        require("harpoon").ui:toggle_quick_menu(list)
      end, { desc = "Show harpoon marks" })

      vim.keymap.set("n", "<M-m>", function()
        require("harpoon").ui:toggle_quick_menu(list)
      end, { desc = "Show harpoon marks" })
    end,
  },
}
