{ config, pkgs, lib, ... }:

let
  slack = pkgs.slack.overrideAttrs (old: {
    installPhase = old.installPhase + ''
      rm $out/bin/slack

      makeWrapper $out/lib/slack/slack $out/bin/slack \
        --prefix XDG_DATA_DIRS : $GSETTINGS_SCHEMAS_PATH \
        --prefix PATH : ${lib.makeBinPath [pkgs.xdg-utils]} \
        --add-flags "--ozone-platform=wayland --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer"
    '';
  });

in

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

  nixpkgs.config = {
    chromium = { enableWideVine = true; };
  };

  networking.hostName = "nixwrk"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  environment.systemPackages = with pkgs; [
    slack
    fluent-reader
    powershell
    caprine-bin
    brave
    tailscale
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.thunar.enable = true;

  services = {
    tumbler.enable = true;
    blueman.enable = true;
    openssh.enable = true;

    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };

  hardware.bluetooth.enable = true;

  security.sudo.wheelNeedsPassword = false;

  networking.firewall = {
    enable = false;
    trustedInterfaces = [ "tailscale0" ];
  };
  
  system.stateVersion = "23.05"; # Did you read the comment?
}

