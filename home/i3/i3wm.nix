{ config, lib, pkgs, ... }:

let 
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      terminal = "alacritty";
      keybindings = lib.mkOptionDefault {
        "${mod}+q" = "kill";
      };
      window = {
	titlebar = false;
      };
      startup = [
        {
          command = "exec --no-startup-id picom";
        }
        {
          command = "exec feh --bg-fill $HOME/dotfiles/wallpapers/nixos-dark-2.wp.png";
          always = true;
        }
      ];
      bars = [
        {
          position = "top";
        }
      ];
    };
  };
}
