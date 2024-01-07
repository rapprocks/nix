{ config, pkgs, ... }:

{

  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.onedark-theme
    ];
    prefix = "C-a";
    terminal = "screen-256color";
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    extraConfig = ''
      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      set -g status-position top
    '';
  };
  
}
