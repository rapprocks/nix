{ config, pkgs, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # proton pass
      { id = "bfogiafebfohielmmehodmfbbebbbpei"; } # Keeper vault
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      #{ id = "aghfnjkcakhmadgdomlmlhhaocbkloab"; } # Just black theme
      { id = "gmjnabaaiekoldfegadnbgaadoaijbjn"; } # Dark VS Code Github Theme
    ];
  };
}
