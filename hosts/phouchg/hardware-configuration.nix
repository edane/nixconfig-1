# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."disk".device = "/dev/disk/by-uuid/7e568ea3-137d-406a-a5bf-22d13e30ce53";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/019967e2-54c9-4011-b5bf-913bd72d3f23";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D11C-2DEF";
      fsType = "vfat";
      options = [ "noauto" "x-systemd.automount" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/03ead536-40b1-40f6-ac53-8cf6a0331d13"; }
    ];

  nix.maxJobs = lib.mkDefault 4;
}
