{pkgs, ...}: {
  imports = [
    ./lualine.nix
    ./neo-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.onedark-nvim];

    extraConfigLua = ''
      require('onedark').setup {
        style = 'darker',
        transparent = true,
        term_colors = true
      }
      require('onedark').load()
    '';

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
