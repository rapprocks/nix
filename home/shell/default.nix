{pkgs, ...}:
{
  imports = [
    ./alacritty.nix
    ./shell.nix
    ./starship.nix
    ./tmux.nix
  ];
}
