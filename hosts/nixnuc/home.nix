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

    chromium = {
      enable = true;
      commandLineArgs = [ "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer,VaapiVideoDecoder,VaapiVideoEncoder" "--ozone-platform=wayland" ];
      extensions = [
          { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # proton pass
          { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
          { id = "aghfnjkcakhmadgdomlmlhhaocbkloab"; } # Just black theme
        ];
    };

  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
