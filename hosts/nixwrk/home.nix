{ config, pkgs, lib, ... }:

{

  imports = [
    ../../modules/sway/sway.nix
    ../../home/alacritty.nix
    ../../home/firefox.nix
    ../../home/shell.nix
    ../../home/mako.nix
    ../../home/waybar.nix
    ../../home/tmux.nix
  ];

  home = {
    username = "philip";
    homeDirectory = "/home/philip";

    stateVersion = "23.05";
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
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
