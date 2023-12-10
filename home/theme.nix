{ config, pkgs, ... }:

{
  
  gtk = {
    enable = true;
    cursorTheme = {
      name = "macOS-BigSur-White";
      package = pkgs.apple-cursor;
    };
  };

}
