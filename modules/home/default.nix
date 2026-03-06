# modules/home/default.nix - Home Manager configuration aggregator
{ ... }:

{
  imports = [
    ./home.nix
    ./hyprland.nix
    ./neovim.nix
    ./git.nix
    ./bash.nix
    ./kitty.nix
    #./noctalia.nix
  ];
}
