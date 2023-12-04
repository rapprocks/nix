{ config, pkgs, ... }:

{

  programs = {

    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autocd = true;
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
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "ssh-agent"
        ];
        theme = "robbyrussell";
      };
    };
  };
}
