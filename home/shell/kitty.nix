{ pkgs, config, ... }: {
  programs.kitty = {
    enable = true;
    environment = {
      "$TERM" = "xterm-256color";
    };
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
    theme = "GitHub Dark High Contrast";
  };
}
