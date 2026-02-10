{ pkgs }:
with pkgs;
[
  # Fonts
  nerd-fonts.jetbrains-mono
  # General packages for development and system management
  openssh
  sshfs
  sqlite
  redis
  wget
  git
  git-lfs
  gh
  zip
  cmake
  gnumake
  ninja
  nodejs
  pnpm
  rustup
  uv
  just

  python312
  python312Packages.jupytext
  # lua51Packages.lua
  # lua51Packages.luarocks
  lua54Packages.lua
  lua54Packages.luarocks

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
  helix
  zoxide
  ripgrep
  fd
  lazygit
  zathura
  # miro
  yazi
  eza
  mdcat
  tldr
  man-pages
  typst
  pngpaste
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
