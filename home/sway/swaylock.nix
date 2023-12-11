{pkgs, ...}: {
  programs.swaylock = {
    settings = {
      image = "$HOME/dotfiles/wallpapers/dark-earth.wp.png";
      daemonize = true;
      ignore-empty-password = true;
    };
  };
}
