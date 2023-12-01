{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      enable = true;
      efiSupport = true;
    };
  };

  networking.hostName = "nixwrk"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  #nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh.enable = true;

  security.sudo.wheelNeedsPassword = false;

  networking.firewall.enable = false;
  
  system.stateVersion = "23.05"; # Did you read the comment?
}

