{pkgs, ...}:
{
  imports = [
    ./alacritty.nix
    ./kitty.nix
    ./shell.nix
    ./starship.nix
    ./tmux.nix
  ];
}
