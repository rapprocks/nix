{ config, pkgs, ... }:

{

  imports = [
    ../../home/sway
    ../../home/alacritty.nix
    ../../home/firefox.nix
    ../../home/shell.nix
    ../../home/mako.nix
    ../../home/tmux.nix
    ../../home/theme.nix
    ../../home/desktop
  ];

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    WLR_NO_HARDWARE_CURSORS = 1;
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    CLUTTER_BACKEND = "wayland";
    XWAYLAND_NO_GLAMOR = 1;
  };

  programs = {
    eza = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
      extraOptions = [ "--group-directories-first" ];
    };
    git = {
      enable = true;
      userName = "rapprocks";
      userEmail = "rapprocks@users.noreply.github.com";
      extraConfig = {
        url = { "ssh://git@github.com/" = { insteadOf = "https://github.com/"; }; };
      };
    };
    obs-studio.enable = true;

  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
