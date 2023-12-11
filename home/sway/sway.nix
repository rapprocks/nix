{ config, pkgs, lib, ... }:

{

  imports = [
  ];

  home.packages = with pkgs; [
    swaylock-effects
    wl-clipboard
    mako
    wofi
    waybar
    wlr-randr
    sway-contrib.grimshot
  ];
  
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show run";
      bars = [{ command = "waybar"; }];
      window = {
        titlebar = false;
      };
      input = {
	"type:keyboard" = {
	  xkb_variant = "mac";
	  xkb_layout = "se";
	  xkb_options = "caps:ctrl_modifier";
	  repeat_delay = "225";
	  repeat_rate = "25";
	};
	"1452:592:Ducky_Ducky_One2_Mini_RGB" = {
	  xkb_variant = "mac";
	  xkb_layout = "se";
	  xkb_options = "altwin:swap_lalt_lwin,caps:ctrl_modifier";
	  repeat_delay = "225";
	  repeat_rate = "25";
	};
	"type:pointer" = {
	  accel_profile = "flat";
	  pointer_accel = "0.7";
	};
      };
      output = {
	HDMI-A-1 = {
	  mode = "2560x1440@143Hz";
	  background = "$HOME/dotfiles/wallpapers/nix-dark.wp.svg fill"; # nixnuc
	};
        DP-1 = {
	  mode = "3440x1440@100Hz";
	  background = "$HOME/dotfiles/wallpapers/nix-dark.wp.svg fill";  }; # nixwrk
      };
      keybindings = lib.mkOptionDefault {
        #"Mod4+l" = "exec swaylock -C $HOME/dotfiles/modules/sway/lock.sh";
        "Mod4+l" = "exec swaylock --clock";
	"Mod4+q" = "kill";
	"Mod4+space" = "exec wofi --show run";
	"Mod4+p" = "exec grimshot save active --notify";
	"Mod4+shift+p" = "exec wl-copy < $(grimshot save area 123.png --notify)";
	"XF86AudioMute" = "exec --no-startup-id 'amixer set Master toggle'";
	"XF86AudioRaiseVolume" = "exec --no-startup-id 'amixer sset Master '5%+''";
	"XF86AudioLowerVolume" = "exec --no-startup-id 'amixer sset Master '5%-''";
      };
    };
  };

}
