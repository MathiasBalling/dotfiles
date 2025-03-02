{ pkgs }:
with pkgs;
[
  # Fonts
  nerd-fonts.jetbrains-mono
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
  tree-sitter
  imagemagick

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
