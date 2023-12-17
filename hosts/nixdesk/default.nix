{ config, pkgs, ... }: {
  imports =
    [ 
      ../../modules/i3

      ./hardware-configuration.nix
    ];

  ### NVIDIA SETTINGS MOVE TO HOST FILE ###

  boot.initrd.kernelModules = [ "nvidia" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    solaar # unifying receiver
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  ### END NVIDIA SETTINGS ###

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

