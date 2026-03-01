# system/nfs.nix - NFS server configuration
# Controlled by machineConfig.enableNFS (defined per-machine in flake.nix)
# This avoids the need for a separate variables.nix file per host —
# all machine-specific toggles live in one place in the flake.
{ machineConfig, ... }:

{
  services = {
    # rpcbind maps RPC program numbers to network addresses (required by NFS)
    rpcbind.enable = machineConfig.enableNFS;
    nfs.server.enable = machineConfig.enableNFS;
  };
}
