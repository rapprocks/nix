{ config, pkgs, lib, ... }:

{

  imports = [
  ];

  home.packages = with pkgs; [
    # All of the below is for sway
    swaylock
    swayidle
    wl-clipboard
    mako
    wofi
    waybar
    wlr-randr
  ];

    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
        menu = "wofi --show run";
        bars = [{
          fonts.size = 8.0;
          position = "top";
        }];
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
	 "type:pointer" = {
           accel_profile = "flat";
	   pointer_accel = "0.7";
	 };
	};
        output = {
          HDMI-A-1 = { mode = "2560x1440@143Hz"; }; # nixnuc
          DP-1 = { mode = "3440x1440@100Hz"; }; # nixwrk
	};
	keybindings = lib.mkOptionDefault {
          "Mod4+l" = "exec swaylock -C $HOME/dotfiles/modules/swaylock.config";
	  "Mod4+q" = "kill";
	};
      };
    };

}
