{ config, pkgs, lib, ... }: {
  
  imports = [
  ];

  home.packages = with pkgs; [
    swaylock-effects
    wl-clipboard
    mako
    waybar
    wlr-randr
    sway-contrib.grimshot
    wdisplays
  ];

  # Chromium args
  programs.chromium = {
    commandLineArgs = [ "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer,VaapiVideoDecoder,VaapiVideoEncoder" "--ozone-platform=wayland" ];
  };
  
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
      terminal = "kitty";
      menu = "rofi -show drun";
      bars = [{ command = "waybar"; }];
      startup = [
        
        {
          command = "pkill kanshi";
          always = true;
        }

        {
          command = "kanshi";
          always = true;
        }

      ];
      window = {
        titlebar = false;
        hideEdgeBorders = "smart";
      };
      window.commands = [
	{
	  criteria.app_id = "pavucontrol";
	  command = "floating enable";
	}
	{
	  criteria.app_id = "feh";
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
      #assigns = {
      #  "alacritty"  = [{title = "Alacritty";}];
      #  "firefox" = [{title = "Firefox";}];
      #};
      #workspaceOutputAssign = [
      #  { workspace = "alacritty";     output = "DP-3";}
      #  { workspace = "firefox";   output = "DP-3";}
      #];
      output = {
	HDMI-A-1 = {
	  mode = "2560x1440@143Hz";
	  background = "$HOME/dotfiles/wallpapers/nixos-dark-2.wp.png fill"; }; # nixnuc
	DP-3 = {
	  mode = "2560x1440@143Hz";
	  background = "$HOME/dotfiles/wallpapers/nixos-dark-2.wp.png fill"; }; # nixdesk
        DP-1 = {
          mode = "3440x1440@99Hz";
	  background = "$HOME/dotfiles/wallpapers/nixos-dark-2.wp.png fill";  }; # nixwrk
      };
      keybindings = lib.mkOptionDefault {
        "Mod4+l" = "exec swaylock -e --image $HOME/dotfiles/wallpapers/nixos-dark-2.wp.png";
	      "Mod4+q" = "kill";
	      "Mod4+space" = "exec rofi -show drun";
	      "Mod4+p" = "exec grimshot --notify save active";
	      "Mod4+shift+p" = "exec wl-copy < $(grimshot --notify save area)";
	      "XF86AudioMute" = "exec --no-startup-id 'amixer set Master toggle'";
	      "XF86AudioRaiseVolume" = "exec --no-startup-id 'amixer sset Master '5%+''";
	      "XF86AudioLowerVolume" = "exec --no-startup-id 'amixer sset Master '5%-''";
      };
    };
  };
}
