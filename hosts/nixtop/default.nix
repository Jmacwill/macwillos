# hosts/nixtop/default.nix
# Entry point for this machine's configuration.
# Imports the auto-generated hardware config, and is the right place to add
# any overrides or extra config that are specific to this machine only
# (e.g. extra packages, services, or mount points that don't belong in shared modules).
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Machine-specific overrides go here, for example:
  # environment.systemPackages = with pkgs; [ some-specific-tool ];
  # services.openssh.enable = true;
}
