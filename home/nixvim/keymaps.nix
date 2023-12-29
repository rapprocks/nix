{config, lib, ...}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      { key = "<C-n>"; action = ":Neotree filesystem reveal left<CR>"; } # open neo tree
      { key = "<leader>h"; action = "<C-w>h"; } # navigate to left window
      { key = "<leader>l"; action = "<C-w>l"; } # navigate to right window
    ];
  };
}
