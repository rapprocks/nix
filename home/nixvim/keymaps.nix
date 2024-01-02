{config, lib, ...}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      
      # Open Neo tree (find one for toggle to close)
      {
        key = "<C-n>";
        action = ":Neotree toggle<CR>";
        options = {
          silent = true;
          desc = "Toggle NeoTree file explorer";
        };
      }

      # Telescope keymaps (better performance)
      {
        key = "<leader>f";
        mode = "n";
        action = "require('telescope.builtin').find_files";
        lua = true;
        options = {
          silent = true;
          desc = "Fuzzy find files";
        };
      }

      {
        key = "<leader>/";
        mode = "n";
        action = "require('telescope.builtin').live_grep";
        lua = true;
        options = {
          silent = true;
          desc = "Live grep";
        };
      }

      # Navigate to left window
      {
        mode = "n";
        key = "<leader>h";
        action = "<C-w>h";
      }

      # Navigate to right window
      {
        mode = "n";
        key = "<leader>l";
        action = "<C-w>l";
      }
    ];
  };
}
