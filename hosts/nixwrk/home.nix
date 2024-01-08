{ config, pkgs, lib, ... }:

{

  imports = [
    ../../home/sway
    ../../home/desktop
    ../../home/shell
    ../../home/nixvim
    ../../home/theme.nix
  ];

  home = {
    username = "philip";
    homeDirectory = "/home/philip";

    stateVersion = "23.05";
  };

  xdg = {
    mimeApps = {
      defaultApplications = {
        "text/html" = "chromium.desktop";
        "x-scheme-handler/http" = "chromium.desktop";
        "x-scheme-handler/https" = "chromium.desktop";
      };
    };
    userDirs = {
      enable = true;
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
