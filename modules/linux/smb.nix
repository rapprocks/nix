{ config, lib, pkgs, ... }:

{

  # For mount.cifs, required unless domain name resolution is not needed.
  environment.systemPackages = [ pkgs.cifs-utils ];

  systemd.tmpfiles.rules = [
    "d /mnt/nas/downloads 0770 philip - -"
    "d /mnt/nas/documents 0770 philip - -"
    "d /mnt/nas/media/movies 0770 philip - -"
    "d /mnt/nas/media/tv 0770 philip - -"
  ];

  fileSystems."/mnt/nas/downloads" = {
    device = "//10.100.0.4/downloads";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in
      [ "${automount_opts},credentials=/home/philip/dotfiles/modules/linux/smb-secrets,uid=1000,gid=1000" ];
  };

  fileSystems."/mnt/nas/documents" = {
    device = "//10.100.0.4/documents";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in
      [ "${automount_opts},credentials=/home/philip/dotfiles/modules/linux/smb-secrets,uid=1000,gid=1000" ];
  };

  fileSystems."/mnt/nas/media/movies" = {
    device = "//10.100.0.4/movies";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in
      [ "${automount_opts},credentials=/home/philip/dotfiles/modules/linux/smb-secrets,uid=1000,gid=1000" ];
  };

  fileSystems."/mnt/nas/media/tv" = {
    device = "//10.100.0.4/tv";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in
      [ "${automount_opts},credentials=/home/philip/dotfiles/modules/linux/smb-secrets,uid=1000,gid=1000" ];
  };

}
