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
  # libclang
  # llvm_18

  # development
  fzf
  tmux
  neovim
  zoxide
  ripgrep
  fd
  lazygit
  zathura
  yazi

  # Text and terminal utilities
  htop
  jq
  tree
  bat
  btop
  coreutils
  neofetch
  killall

  # zsh
  zsh-powerlevel10k
  zsh-syntax-highlighting
  zsh-autosuggestions

  kanata
]
