{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}:

let
  user = "balling";
in
# Define the content of your file as a derivation
{
  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        home = {
          enableNixpkgsReleaseCheck = false;
          packages = pkgs.callPackage ./packages.nix { };
          file = {
            ".config/nvim" = {
              enable = true;
              source = config.lib.file.mkOutOfStoreSymlink "/Users/${user}/dotfiles/nvim";
              recursive = true;
            };
            ".config/yazi" = {
              enable = true;
              source = config.lib.file.mkOutOfStoreSymlink "/Users/${user}/dotfiles/yazi";
              recursive = true;
            };
            ".config/wezterm/wezterm.lua" = {
              enable = true;
              source = config.lib.file.mkOutOfStoreSymlink "/Users/${user}/dotfiles/wezterm/wezterm.lua";
            };
            ".config/zathura/zathurarc" = {
              enable = true;
              source = config.lib.file.mkOutOfStoreSymlink "/Users/${user}/dotfiles/zathura/zathurarc";
            };
            # ".config/kanata/config.kbd" = {
            #   enable = true;
            #   source = config.lib.file.mkOutOfStoreSymlink "/Users/${user}/dotfiles/kanata/config.kbd";
            # };
            ".config/ghostty/config" = {
              enable = true;
              source = config.lib.file.mkOutOfStoreSymlink "/Users/${user}/dotfiles/ghostty/config";
            };
          };
          stateVersion = "25.05";
        };
        programs = { } // import ../shared/home-manager.nix { inherit config pkgs lib; };
      };
  };
}
