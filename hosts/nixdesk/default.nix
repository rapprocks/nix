{ config, pkgs, ... }: {
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/linux/smb.nix
    ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    solaar # unifying receiver
    brave
    ansible
    terraform

    ansible-language-server
    terraform-ls
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

  programs.thunar.enable = true;

  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "nixdesk";
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  services.blueman.enable = true;
  networking.firewall.enable = false;
  system.stateVersion = "23.05"; # Did you read the comment?
}

