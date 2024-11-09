{ pkgs }:
with pkgs;
[
  # General packages for development and system management
  openssh
  sqlite
  wget
  zip
  cmake
  gnumake
  ninja
  nodejs
  pnpm
  rustup

  # Libs
  ffmpeg
  opencv
  fmt

  # development
  fzf
  neovim
  zoxide
  ripgrep
  fd
  lazygit
  zathura
  yazi
  eza
  mdcat

  # Text and terminal utilities
  htop
  jq
  tree
  bat
  btop
  coreutils
  neofetch
  killall

  # stable.kanata
  # Nix format
  nixfmt-rfc-style
  nixd
]
