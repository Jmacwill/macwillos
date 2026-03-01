# modules/home/neovim.nix - neovim configuration
{ config, pkgs, inputs, machineConfig, ... }:

{ 
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
}
