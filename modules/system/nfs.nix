# /modules/system/nfs.nix - NFS server configuration
# Controlled by machineConfig.enableNFS (defined per-machine in flake.nix)
# This avoids the need for a separate variables.nix file per host —
# all machine-specific toggles live in one place in the flake.
{ machineConfig, pkgs, ... }:

{
  # install the required software

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];


 # Enable NFS system
  boot.supportedFilesystems = [ "nfs" ];

  services.rpcbind.enable = true;

  # mount the macwilliams file server

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      options = "noatime";
    };
    what = "100.101.227.116:/mnt/Main_Core/Core_1/";
    where = "/home/jonathan/externalNetworkDrives/NAS";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/home/jonathan/externalNetworkDrives/NAS";
  }];
 
}
