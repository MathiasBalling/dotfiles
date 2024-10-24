return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- vhdl_ls = {},
      -- theme_check = {
      --   cmd = { "shopify", "theme", "language-server" },
      --   root_dir = function(fname)
      --     return vim.loop.cwd()
      --   end,
      -- },
      -- markdown_oxide = {},
      -- nixd = {
      --   cmd = { "nixd" },
      --   settings = {
      --     nixd = {
      --       nixpkgs = {
      --         expr = 'import (builtins.getFlake "/Users/balling/dotfiles").inputs.nixpkgs { }',
      --       },
      --       formatting = {
      --         command = { "nixfmt" }, -- or nixfmt or nixpkgs-fmt
      --       },
      --       options = {
      --         -- nixos = {
      --         --   expr = '(builtins.getFlake "/PATH/TO/FLAKE").nixosConfigurations.CONFIGNAME.options',
      --         -- },
      --         -- home_manager = {
      --         --   expr = '(builtins.getFlake "/PATH/TO/FLAKE").homeConfigurations.CONFIGNAME.options',
      --         -- },
      --         nix_darwin = {
      --           expr = '(builtins.getFlake "/Users/balling/dotfiles").darwinConfigurations.aarch64-darwin.options',
      --         },
      --       },
      --     },
      --   },
      -- },
    },
  },
}
