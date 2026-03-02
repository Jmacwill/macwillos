# /modules/home/bash.nix - User-level configuration with Home Manager
{ machineConfig, ... }:

{
  # Bash configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -la";
      # Rebuild automatically detects which machine you're on
      rebuild = "sudo nixos-rebuild switch --flake .#${machineConfig.hostname}";
      update = "nix flake update";
    };
  };
}
