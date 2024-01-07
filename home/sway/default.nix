{pkgs, ...}:
{
  imports = [
    ./sway.nix
    ./swayidle_new_new.nix
    ./waybar.nix
    ./wofi.nix
    ./rofi.nix
    ./mako.nix
    ./kanshi.nix
  ];
}
