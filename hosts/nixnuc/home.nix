{ config, pkgs, ... }: {
  
  imports = [
    ../../home/sway
    ../../home/desktop
    ../../home/shell
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
