{pkgs, ...}: {
  imports = [
    ./lualine.nix
    ./neo-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
      transparentBackground = true;
    };
    #extraPlugins = [ pkgs.vimPlugins.onedark-nvim];
    #colorscheme = "onedark";

    plugins = {
      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;
      
    };
  };
}
