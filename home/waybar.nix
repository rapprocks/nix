{ config, pkgs, lib, ... }:

{
  home.file = {
    ".config/waybar/style.css".source = ./style.css;
  };
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top"; # Waybar at top layer
        position = "top"; # Waybar position (top|bottom|left|right)
        height = 25; # Waybar height
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [
          "pulseaudio"
          "bluetooth"
          "clock"
        ];
        "sway/workspaces" = {
          disable-scroll = true;
          disable-markup = false;
          all-outputs = false;
          format = "  {icon}  ";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            "focused" = "";
            "default" = "";
          };
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d %H:%M} ";
          format = "{:%H:%M} ";
        };
        "bluetooth" = {
          format = "<b>{icon}</b>";
          format-alt = "{status} {icon}";
          interval = 30;
          format-icons = {
            "enabled" = "";
            "disabled" = "";
          };
          tooltip-format = "{}";
        };
        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{volume}% {icon}";
          "format-muted" = "";
          "format-icons" = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "󰋎";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" ];
          };
          "on-click" = "pavucontrol";
        };
      }
    ];
  };
}

