{pkgs, ...}:
{
  imports = [
    ./sway.nix
    ./swayidle-new.nix
    ./waybar.nix
    ./wofi.nix
    ./rofi.nix
    ./mako.nix
    ./kanshi.nix
  ];
}
