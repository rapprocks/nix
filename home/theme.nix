{ config, pkgs, ... }:

{

  gtk = {
    enable = true;
    cursorTheme = {
      name = "macOS-BigSur-White";
      package = pkgs.apple-cursor;
    };
    theme = {
      name = "Qogir-Dark";
      package = pkgs.qogir-theme;
    };
    iconTheme = {
      name = "Flat-Remix-Orange-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
  };

}
