{ pkgs }:
with pkgs; [
  # General packages for development and system management
  openssh
  sqlite
  wget
  zip
  cmake
  gnumake
  ninja
  nodejs
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
]
