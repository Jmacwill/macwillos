# modules/home/default.nix - Home Manager configuration aggregator
{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./home.nix
    ./hyprland.nix
    ./neovim.nix
    ./git.nix
    ./bash.nix
    ./kitty.nix
    ./noctalia.nix
  ];
}
