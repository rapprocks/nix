{ config, pkgs, ... }:

{

  programs = {

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        line_break = false;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };

  };
}
