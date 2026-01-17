{
  config,
  pkgs,
  lib,
  ...
}:
let
  name = "Mathias Balling";
  user = "balling";
  email = "math260r@gmail.com";
  filePathZshInstant = "$HOME/.cache/p10k-instant-prompt-${user}.zsh";
in
{
  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = false;
    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
      }
      {
        name = "autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./programs/zsh;
        file = "p10k.zsh";
      }
    ];
    enableCompletion = false;

    shellAliases =
      let
        nvim = "${pkgs.neovim}/bin/nvim";
        eza = "${pkgs.eza}/bin/eza";
        lazygit = "${pkgs.lazygit}/bin/lazygit";
        eza_params = "--git --icons --group --group-directories-first --time-style=long-iso --color-scale=all";
      in
      {
        n = "${nvim}";
        nv = "${nvim}";
        c = "clear";
        t = "tmux-sessionizer-z";
        lg = "${lazygit}";
        ".." = "cd ..";
        "..." = "cd ../..";
        ls = "${eza} ${eza_params}";
        lsa = "${eza} -a ${eza_params}";
        l = "${eza} --git-ignore ${eza_params}";
        ll = "${eza} --all --header --long ${eza_params}";
        llm = "${eza} --all --header --long --sort=modified ${eza_params}";
        la = "${eza} -lbhHigUmuSa";
        lx = "${eza} -lbhHigUmuSa@";
        lt = "${eza} --tree ${eza_params}";
        lt1 = "${eza} --tree -L 1 ${eza_params}";
        lt2 = "${eza} --tree -L 2 ${eza_params}";
        lt3 = "${eza} --tree -L 3 ${eza_params}";
        tree = "${eza} --tree ${eza_params}";
      };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        # "sudo"
        # "vi-mode"
        "rust"
      ];
    };
    envExtra = ''
      export PATH="/Library/TeX/texbin/:$PATH"
      export PATH="$PATH:/opt/homebrew/bin/"
    '';

    initContent = ''
        if [[ -r ${filePathZshInstant} ]]; then
          source ${filePathZshInstant}
        fi

        if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
          source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
          source /nix/var/nix/profiles/default/etc/profile.d/nix.sh
        fi

        # Remove history data we don't want to see
        export HISTIGNORE="pwd:ls:cd"

        # Ignore duplicates history entries
        export HISTCONTROL=ignoredups

        # For upper/lower case correction
        ENABLE_CORRECTION="true"

        export PAGER='nvim +Man!'

        # Add /.local/bin to the PATH
        export PATH=$HOME/.local/bin:$PATH
        export PATH=$HOME/.cargo/bin/:$PATH
        export PATH="$HOME/.config/scripts:$PATH"

        if [[ -n $SSH_CONNECTION ]]; then
          export EDITOR='vim'
        else
          export EDITOR='nvim'
        fi
        # export PATH=$PATH:{pkgs.libclang}/bin/
        # export CC={pkgs.libclang}/bin/clang
        # export CXX={pkgs.libclang}/bin/clang++

        # Allow for the use of yazi to change directories when exiting
        function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
          fi
          rm -f -- "$tmp"
        }

      export _ZO_EXCLUDE_DIRS="*/out:*/target"


    ''
    + (
      if pkgs.stdenv.isDarwin then
        ''
          if [[ -f /opt/homebrew/bin/brew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
          fi

          local matlab=/Applications/$(ls /Applications | grep MATLAB | tail -n 1)
          if [[ -d $matlab ]]; then
            PATH="$matlab/bin:$PATH"
          fi

          if [[ -d /opt/homebrew/opt/avr-gcc@14/bin ]]; then
            export PATH="/opt/homebrew/opt/avr-gcc@14/bin:$PATH"
          fi
        ''
      else
        ""
    );
  };
  man = {
    enable = true;
  };
  direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  tmux = {
    # tmux
    enable = true;
    historyLimit = 50000;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    sensibleOnTop = false; # Bug where sh is default shell
    shell = "${pkgs.zsh}/bin/zsh";
    newSession = false;
    shortcut = "a";
    terminal = "tmux-256color";
    escapeTime = 0;
    resizeAmount = 5;
    clock24 = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-fzf
      tmuxPlugins.fzf-tmux-url
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
    ];
    extraConfig = ''
      set-option -sa terminal-features ',xterm-256color:RGB'
      bind-key C-a send-prefix

      # set shell
      # set -g default-shell ${pkgs.zsh}/bin/zsh

      # For yazi
      set -g allow-passthrough all
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      # Splits
      unbind %
      unbind '"'
      bind | split-window -h 
      bind - split-window -v
      bind _ split-window -v

      set -g mouse on
      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

      # Escape turns on copy mode
      bind Escape copy-mode

      bind-key -n C-t run-shell "$HOME/.config/scripts/tmux-sessionizer-z"

      # Don't exit copy mode when dragging with mouse
      unbind -T copy-mode-vi MouseDragEnd1Pane

      # Status bar
      bind-key u set-option -g status

      # Set default position
      set -g status-position top
      set -g status off
      set -g base-index 0
      set -g pane-base-index 0
      set -g renumber-windows on

      bind -r m resize-pane -Z


      # Close
      bind-key x kill-pane
      bind-key & kill-window
      set-option -g detach-on-destroy off

      # Plugins settings
      set -g @continuum-restore 'off'
      set -g @resurrect-capture-pane-contents 'off'
      TMUX_FZF_LAUNCH_KEY="f"

      # TokyoNight colors for Tmux
      set -g mode-style "fg=#ff0000,bg=#00ff00"

      set -g message-style "fg=#7aa2f7,bg=#3b4261"
      set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

      set -g pane-border-style "fg=#3b4261"
      set -g pane-active-border-style "fg=#7aa2f7"

      set -g status "on"
      set -g status-justify "left"

      set -g status-style "fg=#7aa2f7,bg=#16161e"

      set -g status-left-length "100"
      set -g status-right-length "100"

      set -g status-left-style NONE
      set -g status-right-style NONE

      set -g status-left "#[fg=#15161e,bg=#7aa2f7,bold] #S #[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics]"
      set -g status-right "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#16161e] #{prefix_highlight} #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d  %I:%M %p #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#15161e,bg=#7aa2f7,bold] #h "
      if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
        set -g status-right "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#16161e] #{prefix_highlight} #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d  %H:%M #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#15161e,bg=#7aa2f7,bold] #h "
      }

      setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"
      setw -g window-status-separator ""
      setw -g window-status-style "NONE,fg=#a9b1d6,bg=#16161e"
      setw -g window-status-format "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]"
      setw -g window-status-current-format "#[fg=#16161e,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261,bold] #I  #W #F #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics]"
    '';
  };

  git = {
    enable = true;
    ignores = [
      "*.swp"
      ".DS_Store"
      ".vscode/"
      "target/"
      ".cache/"
      "out/"
      "build"
    ];
    settings = {
      user.name = name;
      user.email = email;
      init.defaultBranch = "main";
      core = {
        editor = "nvim";
        autocrlf = "input";
      };
      pull.rebase = true;
      rebase.autoStash = true;
    };
    lfs = {
      enable = true;
    };
  };

  # ssh = {
  #   enable = true;
  #   includes = [
  #     (lib.mkIf pkgs.stdenv.hostPlatform.isLinux "/home/${user}/.ssh/config_external")
  #     (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin "/Users/${user}/.ssh/config_external")
  #   ];
  #   matchBlocks = {
  #     "github.com" = {
  #       identitiesOnly = true;
  #       identityFile = [
  #         (lib.mkIf pkgs.stdenv.hostPlatform.isLinux "/home/${user}/.ssh/id_github")
  #         (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin "/Users/${user}/.ssh/id_github")
  #       ];
  #     };
  #   };
  # };

}
