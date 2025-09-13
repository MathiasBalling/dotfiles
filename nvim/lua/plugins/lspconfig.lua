return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- clangd = {
      --   mason = false,
      -- },
      -- vhdl_ls = {},
      shopify_theme_ls = {
        cmd = {
          "shopify",
          "theme",
          "language-server",
        },
        filetypes = { "liquid" },
        -- root dir is the parent directory of the liquid files
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("config/")(fname)
        end,
      },
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
