# /modules/home/home.nix - User-level configuration with Home Manager
{
  pkgs,
  inputs,
  machineConfig,
  ...
}:

{
  # Automatically uses the machine's username
  home.username = machineConfig.username;
  home.homeDirectory = "/home/${machineConfig.username}";
  home.stateVersion = "24.05";

  # User packages
  home.packages = with pkgs; [
    # Terminal utilities
    htop # cpu monitor
    ripgrep # faster version of grep
    fd # better file finder
    eza # EZA is a replacement for ls
    psmisc # adds killall, pstree etc.

    # Fonts for Waybar
    nerd-fonts.jetbrains-mono

    # Basic tools
    brave # Brave Browser
    discord

    #coding tools
    vscode
    nixfmt
    nixd
    python3 
  ];

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # setup path for nixpkgs

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs}"
  ];
}
