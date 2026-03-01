# modules/home/default.nix - Home Manager configuration aggregator
{ config, pkgs, inputs, machineConfig, ... }:

{
  imports = [
    ./home.nix
    ./hyprland.nix
    ./neovim.nix
    ./git.nix
    ./bash.nix
    ./kitty.nix
  ];
}
