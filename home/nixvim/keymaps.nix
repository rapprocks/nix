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
