{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  environment.systemPackages = with pkgs; [
    fluent-reader
    caprine-bin
    solaar
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
      gfxmodeEfi = "2560x1440";
    };
  };

  # Enable Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    logitech.wireless.enable = true;
  };
  services.blueman.enable = true;

  programs.thunar.enable = true;


  networking.hostName = "nixnuc";
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  security.sudo.wheelNeedsPassword = false;

  networking.firewall.enable = false;

  system.stateVersion = "23.05";

}

