{ config, lib, pkgs, ... }: 
let
  mod = "Mod4";
in 
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "alacritty";
      keybindings = lib.mkOptionDefault {
        "${mod}+q" = "kill";
      };
    };
  };
  }
