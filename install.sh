#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap zegervdv/zathura # Zathura
brew tap shopify/shopify  # Shopify cli

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install cmake
brew install curl
brew install fd
brew install fzf
brew install lazygit
brew install llvm
brew install node
brew install mas
brew install git
brew install neovim
brew install ripgrep
brew install yazi
brew install zathura
brew install zathura-pdf-poppler
brew install zoxide
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting
brew install tmux
brew install python3

brew install bat
brew install bear
brew install boost
brew install ffmpeg
brew install gh
brew install jq
brew install lua
brew install luajit
brew install meson
brew install ninja
brew install opencv
brew install pandoc
brew install pnpm
brew install shopify-cli
brew install sqlite
brew install tree-sitter

## Casks
echo "Installing Brew Casks..."
brew install --cask aerospace
brew install --cask arc
brew install --cask wezterm
brew install --cask alfred
brew install --cask alt-tab
brew install --cask aldente
brew install --cask iina
brew install --cask shottr
brew install --cask obsidian
brew install --cask cleanmymac
brew install --cask betterdisplay
brew install --cask git-credential-manager
brew install --cask deepl
brew install --cask balenaetcher
brew install --cask docker
brew install --cask utm
brew install --cask spotify
brew install --cask mactex-no-gui

### Reversing
# brew install --cask machoview
# brew install --cask hex-fiend
# brew install --cask cutter
# brew install --cask sloth

### Fonts
# brew install --cask sf-symbols
# brew install --cask font-hack-nerd-font
# brew install --cask font-jetbrains-mono
# brew install --cask font-fira-code

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1176895641 # Spark
mas install 1452453066 # Hidden Bar
mas install 425424353 # The Unarchiver


echo "Manually install the following apps:"
echo "1. Davinci Resolve"
echo "2. Microsoft Office"
echo "3. Adobe Creative Cloud"
echo "4. Discord"
echo "5. Google Drive"
echo "6. Notion"
echo "7. Kmonad (keyboard remapping)"


# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool false
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write -g NSWindowShouldDragOnGesture YES

## Fix for MX Master 3S
#sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:FelixKratz/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master

# Start Services
echo "Starting Services (grant permissions)..."
# echo "(optional) Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Installation complete...\n"
