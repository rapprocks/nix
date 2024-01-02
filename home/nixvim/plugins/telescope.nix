{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      #extensions.fzf-native.enable = true;

      defaults = {
        file_ignore_patterns = [
          "^.git/"
        ];
        layout_config = {
          horizontal = {
            width = 0.9;
            preview_width = 0.5;
          };
        };
        set_env.COLORTERM = "truecolor";
      };
    };
  };
}
