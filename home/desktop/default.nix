{pkgs, ...}: {
  imports = [
    ./spotify.nix
    ./chromium.nix
  ];
}
