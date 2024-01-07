{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources.formatting = {
      prettier = {
        enable = true;
      };
      alejandra.enable = true;
    };
  };
}
