{ config, pkgs, ... }: {
  programs.chromium = {
    enable = true;
    commandLineArgs = [ "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer,VaapiVideoDecoder,VaapiVideoEncoder" "--ozone-platform=wayland" ];
    extensions = [
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # proton pass
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      #{ id = "aghfnjkcakhmadgdomlmlhhaocbkloab"; } # Just black theme
      { id = "gmjnabaaiekoldfegadnbgaadoaijbjn"; } # Dark VS Code Github Theme
    ];
  };
}
