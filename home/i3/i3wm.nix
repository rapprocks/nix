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
    };
  };
}
