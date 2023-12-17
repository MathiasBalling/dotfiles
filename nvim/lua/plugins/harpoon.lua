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
      require("harpoon"):setup()
      vim.keymap.set("n", "<M-p>", function()
        require("harpoon"):list():prev()
      end, {
        desc = "Go to previous harpoon mark",
      })
    end,
    keys = {
      {
        "<leader>hm",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Mark file with harpoon",
      },
      {
        "<M-n>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Go to next harpoon mark",
      },
      {
        "<leader>ha",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Show harpoon marks",
      },
    },
  },
}
