{pkgs, ...}:
{
  imports = [
    ./sway.nix
    ./swayidle.nix
    ./waybar.nix
    ./wofi.nix
  ];
}
