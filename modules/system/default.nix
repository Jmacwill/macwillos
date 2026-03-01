# modules/system/default.nix - System-wide configuration aggregator
{ config, pkgs, inputs, machineConfig, ... }:

{
  imports = [
    ./configuration.nix
    ./hyprland.nix
  ];
}
