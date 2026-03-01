# modules/home/neovim.nix - Neovim with Dracula theme
{ pkgs, ... }:

{
  programs.neovim = {
    enable = true; defaultEditor = true; viAlias = true; vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-treesitter
      dracula-nvim
    ];

    extraConfig = ''
      set termguicolors
      colorscheme dracula

      " Transparent background so Kitty blur shows through
      highlight Normal     guibg=NONE ctermbg=NONE
      highlight NormalNC   guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE

      set number relativenumber
      set tabstop=2 shiftwidth=2 expandtab smartindent
      set mouse=a
      set ignorecase smartcase hlsearch incsearch
    '';
  };
}
