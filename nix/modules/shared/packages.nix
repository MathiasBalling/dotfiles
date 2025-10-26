{ pkgs }:
with pkgs;
[
  # Fonts
  nerd-fonts.jetbrains-mono
  # General packages for development and system management
  openssh
  sqlite
  redis
  wget
  git
  gh
  zip
  cmake
  gnumake
  ninja
  nodejs
  pnpm
  rustup
  uv
  python312
  python312Packages.jupytext
  # python314
  # python314Packages.jupytext
  pandoc

  dfu-util # For esp-idf

  # libclang
  tree-sitter
  ast-grep
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
  tldr
  man-pages
  typst

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
