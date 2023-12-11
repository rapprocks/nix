{ config, pkgs, ... }:

{

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    icons = true;
    borderColor = "#002028";
    borderSize = 2;
    backgroundColor = "#002b36";
    textColor = "#fdf6e3";
    # format = "<b>%s</b> <span color='#93a1a1'>(%a)</span>\n%b"; # Breaks config
  };

}
