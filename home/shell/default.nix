{pkgs, ...}:
{
  imports = [
    ./alacritty.nix
    ./shell.nix
    ./tmux.nix
  ];
}
