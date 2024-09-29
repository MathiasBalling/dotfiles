{ config, pkgs, lib, home-manager, ... }:

let
    user = "balling";
  # Define the content of your file as a derivation
in
{
  imports = [
   ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    # Casks (GUI) applications
    casks = pkgs.callPackage ./casks.nix {};
    # Brews (CLI) applications not available in nixpkgs
    brews = [
      ];
    onActivation.cleanup = "uninstall";

    masApps = {
      "Spark Desktop" = 6445813049;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = lib.mkMerge [
        ];
        stateVersion = "23.11";
      };
      programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      # manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/System/Applications/Messages.app/"; }
    { path = "/System/Applications/Facetime.app/"; }
    { path = "/Applications/Arc.app/"; }
    { path = "/Applications/WezTerm.app/"; }
    {
      path = "${config.users.users.${user}.home}/.local/share/";
      section = "others";
      options = "--sort name --view grid --display folder";
    }
    {
      path = "${config.users.users.${user}.home}/Downloads/";
      section = "others";
      options = "--sort name --view grid --display stack";
    }
  ];

}
