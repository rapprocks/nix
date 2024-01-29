{ config, pkgs, ... }: {

  boot.kernelParams = [ "intel_iommu=on" ];
  boot.kernelModules = [ "vfio" "vfio_pci" "vfio_virqfd" "vfio_iommu_type1" ];
  #boot.extraModprobeConfig = "options vfio-pci ids=";

  environment.systemPackages = with pkgs; [
    qemu
    OVMF
  ];

  virtualisation.libvirtd = { 
    enable = true;
  };

  users.groups.libvirtd.members = [ "root" "philip"];

  programs.virt-manager.enable = true;
}
