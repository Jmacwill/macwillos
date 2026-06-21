# /modules/home/steam.nix - User-level configuration for Steam
{
  pkgs,
  inputs,
  ...
}:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    };
  programs.gamemode.enable = true;
};
