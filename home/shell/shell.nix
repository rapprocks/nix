{ config, pkgs, ... }: {
  programs = {

    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autocd = true;
      profileExtra = ''
        [ "$(tty)" = "/dev/tty1" ] && exec sway
      '';
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch";
        vi = "nvim";
        ip = "ip --color";
        cp = "rsync -ah --progress";
        docs = "cd /mnt/nas/documents";
        down = "cd /mnt/nas/downloads";
        media = "cd /mnt/nas/media";
        dot = "cd ~/dotfiles";
        tree = "tree -C";
        dev = "cd ~/Developer";
        weather = "curl -S 'https://wttr.in/Stockholm?1F'";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" ];
      };
    };
  };
}
