{ config, lib, pkgs, ... }:

with lib;

let
 cfg = config.my.nfsd;

in {
  options = {
    my.nfsd = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enables nfsd and configures ports and stuff.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    # Enable nfs server.
    services.nfs.server.enable = true;

    # Configure ports
    services.nfs.server.statdPort = 4000;
    services.nfs.server.lockdPort = 4001;

    # Open ports used by NFS
    networking.firewall.allowedTCPPorts = [ 2049 111 4000 4001 20048 ];
    networking.firewall.allowedUDPPorts = [ 2049 111 4000 4001 20048 ];
  };
}
