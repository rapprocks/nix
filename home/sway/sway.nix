{ config, pkgs, lib, ... }:
{
  imports = [
  ];
  home.packages = with pkgs; [
    swaylock-effects
    wl-clipboard
    mako
    waybar
    wlr-randr
    sway-contrib.grimshot
    xorg.xlsclients
    xorg.xwininfo
  ];
  
  wayland.windowManager.sway = {

    extraSessionCommands = ''
      export MOZ_ENABLE_WAYLAND="1"
      export NIXOS_OZONE_WL="1"
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export QT_QPA_PLATFORM=wayland
    '';

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
      window.commands = [
	{
	  criteria.app_id = "pavucontrol";
	  command = "floating enable";
	}
      ];
      input = {
	      "type:keyboard" = {
	        xkb_variant = "mac";
	        xkb_layout = "se";
	        xkb_options = "caps:ctrl_modifier";
	        repeat_delay = "225";
	        repeat_rate = "50";
	      };
	      "1452:592:Ducky_Ducky_One2_Mini_RGB" = {
	        xkb_variant = "mac";
	        xkb_layout = "se";
	        xkb_options = "altwin:swap_lalt_lwin,caps:ctrl_modifier";
	        repeat_delay = "225";
	        repeat_rate = "50";
	      };
	      "type:pointer" = {
	        accel_profile = "flat";
	        pointer_accel = "0.6";
	      };
      };
      output = {
	HDMI-A-1 = {
	  mode = "2560x1440@143Hz";
	  background = "$HOME/dotfiles/wallpapers/nixos-dark-2.wp.png fill"; }; # nixnuc
        DP-1 = {
          mode = "2560x1440@143Hz";
	  background = "$HOME/dotfiles/wallpapers/nixos-dark-2.wp.png fill";  }; # nixwrk
      };
      keybindings = lib.mkOptionDefault {
        "Mod4+l" = "exec swaylock -e --image $HOME/dotfiles/wallpapers/nixos-dark-2.wp.png";
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
