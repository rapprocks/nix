{pkgs, ...}: {
  imports = [
    ./spotify.nix
    ./notion.nix
    ./chromium.nix
    ./firefox.nix
  ];
}
