{ config, pkgs, lib, ... }:

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

  home = {
    username = "philip";
    homeDirectory = "/home/philip";

    stateVersion = "23.05";
  };

  xdg.mimeApps = {
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
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
    feh.enable = true;
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
