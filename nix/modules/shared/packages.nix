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
  bun
  rustup
  uv
  just
  opencode
  # claude-code

  python312
  # python312Packages.jupytext
  # python314
  # python314Packages.jupytext
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
  # neovim
  bob-nvim
  helix
  zoxide
  ripgrep
  fd
  lazygit
  zathura
  yazi
  eza
  glow
  tldr
  man-pages
  typst
  pngpaste
  jq
  tree
  bat
  btop
  coreutils
  killall

  # stable.kanata
  # Nix format
  nixfmt
  nixd
]
