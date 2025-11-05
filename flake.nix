{
  description = "Balling's Nix configuration for MacOS, Linux(WIP) & NixOS(WIP)";

  outputs =
    {
      self,
      darwin,
      nix-homebrew,
      homebrew-bundle,
      homebrew-core,
      homebrew-cask,
      home-manager,
      nixpkgs,
      nixpkgs-stable,
      aerospace-tap,
      shopify-tap,
      sketchybar-tap,
      avr-tap,
    }@inputs:
    let
      user = "balling";
      hostname = "balling";
      email = "math260r@gmail.com";
      linuxSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      darwinSystems = [
        "aarch64-darwin"
      ];

      # Function to create an app script
      mkApp = scriptName: system: {
        type = "app";
        program = "${
          (nixpkgs.legacyPackages.${system}.writeScriptBin scriptName ''
            #!/usr/bin/env bash
            PATH=${nixpkgs.legacyPackages.${system}.git}/bin:$PATH
            echo "Running ${scriptName} for ${system}"
            exec ${self}/nix/apps/${system}/${scriptName}
            # exec ${self}/nix/apps/${scriptName}
          '')
        }/bin/${scriptName}";
      };

      mkLinuxApps = system: {
        "build-switch" = mkApp "build-switch" system;
      };

      mkDarwinApps = system: {
        "build" = mkApp "build" system;
        "build-switch" = mkApp "build-switch" system;
        "rollback" = mkApp "rollback" system;
      };
    in
    {
      # devShells = forAllSystems devShell;
      apps =
        nixpkgs.lib.genAttrs linuxSystems mkLinuxApps // nixpkgs.lib.genAttrs darwinSystems mkDarwinApps;

      darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (
        system:
        let
          inherit user;
        in
        darwin.lib.darwinSystem {
          inherit system;

          specialArgs =
            let
              pkgs-stable = import nixpkgs-stable {
                config.allowUnfree = true;
                localSystem = {
                  inherit system;
                };
              };

            in
            {
              inherit pkgs-stable inputs;
            }; # Add nix-stable to the list of inputs

          modules = [
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                inherit user;
                enable = true;
                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "homebrew/homebrew-bundle" = homebrew-bundle;
                  "nikitabobko/homebrew-tap" = aerospace-tap;
                  "shopify/homebrew-shopify" = shopify-tap;
                  "FelixKratz/homebrew-formulae" = sketchybar-tap;
                  "osx-cross/avr" = avr-tap;
                };
                mutableTaps = false;
              };
            }
            ./nix/hosts/darwin
          ];
        }
      );
      #  Standalone home-manager configuration entrypoint
      #  Available through 'home-manager --flake .# your-username@your-hostname'
      # homeConfigurations = {
      #   "ubuntu" = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs; # > Our main home-manager configuration file <
      #     modules = [ ./nix/modules/ubuntu ];
      #     extraSpecialArgs =
      #       let
      #         inherit hostname;
      #         username = user;
      #       in
      #       {
      #         inherit
      #           self
      #           inputs
      #           username
      #           hostname
      #           email
      #           ;
      #       };
      #   };
      # };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    aerospace-tap = {
      url = "github:nikitabobko/homebrew-tap";
      flake = false;
    };
    shopify-tap = {
      url = "github:shopify/homebrew-shopify";
      flake = false;
    };
    sketchybar-tap = {
      url = "github:FelixKratz/homebrew-formulae";
      flake = false;
    };
    avr-tap = {
      url = "github:osx-cross/homebrew-avr";
      flake = false;
    };
  };
}
