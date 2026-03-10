# modules/system/default.nix - System-wide configuration aggregator
{ ... }:

{
  imports = [
    ./configuration.nix
    ./hyprland.nix
    ./nfs.nix
    ./noctalia.nix
    ./programming.nix
  ];
}
