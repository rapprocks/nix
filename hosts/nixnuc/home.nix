{ config, pkgs, ... }:

{

  imports = [
    ../../modules/sway/sway.nix
    ../../home/alacritty.nix
    ../../home/firefox.nix
    ../../home/shell.nix
    ../../home/mako.nix
    ../../home/tmux.nix
    ../../home/waybar.nix
    ../../home/theme.nix
  ];

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
