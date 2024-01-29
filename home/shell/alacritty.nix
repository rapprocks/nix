{ config, pkgs, ... }:
{

  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      env.TERM = "xterm-256color";
      url = {
        launcher = "open";
        modifiers = "shift";
      };
      font = {
        size = 14;
        glyph_offset = {
          x = 0;
          y = 0;
        };
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };
      window = {
        padding.x = 4;
        padding.y = 1;
      };
      decorations = "None";
      draw_bold_text_with_bright_colors = true;
      colors = {
        primary = {
          background = "0x0a0c10";
          foreground = "0xf0f3f6";
        };
        cursor = {
          text = "0x0a0c10";
          cursor = "0xf0f3f6";
        };
        normal = {
          black = "0x7a828e";
          red = "0xff9492";
          green = "0x26cd4d";
          yellow = "0xf0b72f";
          blue = "0x71b7ff";
          magenta = "0xcb9eff";
          cyan = "0x39c5cf";
          white = "0xd9dee3";
        };
        bright = {
          black = "0x9ea7b3";
          red = "0xffb1af";
          green = "0x4ae168";
          yellow = "0xf7c843";
          blue = "0x91cbff";
          magenta = "0xcb9eff";
          cyan = "0x39c5cf";
          white = "0xd9dee3";
        };
      };
    };
  };
}
