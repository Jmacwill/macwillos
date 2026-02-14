# home/home.nix - User-level configuration with Home Manager
{ config, pkgs, inputs, machineConfig, ... }:

{
  # Automatically uses the machine's username
  home.username = machineConfig.username;
  home.homeDirectory = "/home/${machineConfig.username}";
  home.stateVersion = "24.05";

  # User packages
  home.packages = with pkgs; [
    # Terminal utilities
    htop
    ripgrep
    fd
    eza
    
    # Hyprland essentials
    waybar          # Status bar
    wofi            # App launcher
    kitty           # Terminal emulator
    dunst           # Notifications
    
    # Basic tools
    firefox
    pavucontrol     # Audio control
  ];

  # Neovim configuration
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    # Basic plugins to get started
    plugins = with pkgs.vimPlugins; [
      vim-nix         # Nix syntax highlighting
      nvim-treesitter # Better syntax highlighting
    ];
    
    extraConfig = ''
      " Basic settings
      set number
      set relativenumber
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set smartindent
      
      " Enable mouse
      set mouse=a
      
      " Better search
      set ignorecase
      set smartcase
      set hlsearch
      set incsearch
    '';
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "jmacwill";
    userEmail = "jonathan.macwilliams@gmail.com";
  };

  # Bash configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -la";
      # Rebuild automatically detects which machine you're on
      rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#${machineConfig.hostname}";
      update = "nix flake update";
    };
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
