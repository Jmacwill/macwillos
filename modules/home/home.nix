# /modules/home/home.nix - User-level configuration with Home Manager
{ config, pkgs, inputs, machineConfig, ... }:

{
  # Automatically uses the machine's username
  home.username = machineConfig.username;
  home.homeDirectory = "/home/${machineConfig.username}";
  home.stateVersion = "24.05";

  # User packages
  home.packages = with pkgs; [
    # Terminal utilities
    htop      # cpu monitor
    ripgrep   # faster version of grep
    fd        # better file finder
    eza       # EZA is a replacement for ls 
    psmisc    # adds killall, pstree etc.
    
    # Add Kitty here
    kitty     # Terminal Program

    # Fonts for Waybar
    nerd-fonts.jetbrains-mono

    # Basic tools
    brave     #Brave Browser
  ];


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

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
