{ config, pkgs, ... }:

{

  gtk = {
    enable = true;
    cursorTheme = {
      name = "macOS-BigSur-White";
      package = pkgs.apple-cursor;
    };
    theme = {
      name = "Flat-Remix-GTK-Blue-Dark-Solid";
      package = pkgs.flat-remix-gtk;
    };
    iconTheme = {
      name = "Flat-Remix-Orange-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
  };

}
