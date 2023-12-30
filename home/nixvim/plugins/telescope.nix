{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        # Find files using Telescope command-line sugar.
        "<leader>f" = {
          action = "find_files";
          desc = "Telescope find files";
        };
        #"<leader>f" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>b" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fd" = "diagnostics";

        # FZF like bindings
        "<C-p>" = "git_files";
        "<leader>p" = "oldfiles";
        "<C-f>" = "live_grep";
      };

      keymapsSilent = true;

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
