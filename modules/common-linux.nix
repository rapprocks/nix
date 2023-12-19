{ config, pkgs, ... }:

{
  imports =
  [
  ];

  environment.systemPackages = with pkgs; [
    neovim
    wget
    tree
    btop
    tldr
    gcc
    nnn
    ranger
    blueberry
    pavucontrol
    ueberzugpp
    libnotify
    xdg-utils
    gtk-engine-murrine
    gnome.gnome-tweaks
  ];

  time.timeZone = "Europe/Stockholm";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "se";
    xkbVariant = "mac";
    xkbOptions = "caps:ctrl_modifier";

    autoRepeatDelay = 225;
    autoRepeatInterval = 25;
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

   fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "Hack" "JetBrainsMono" "FiraCode" ]; })
      noto-fonts
      noto-fonts-emoji
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };

  users.users.philip = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Hardware Support for Wayland Sway
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
      ];
      configPackages = with pkgs; [
        xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
      ];
    };
  };

  # Allow swaylock to unlock the computer for us
  security.pam.services.swaylock = {
    text = "auth include login";
  };

  services.gnome.gnome-keyring.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 2d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.dconf.enable = true;

  system.stateVersion = "23.05";
}
