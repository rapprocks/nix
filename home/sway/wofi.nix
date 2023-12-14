{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
    };
    style = ''
      window {
        background-color: #efefef;
      }
    '';
  };
}
