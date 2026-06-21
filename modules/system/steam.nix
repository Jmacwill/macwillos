# /modules/home/steam.nix - User-level configuration for Steam
{
  ...
}:

{
 # _class = "nixos";
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    };
#  programs.gamemode.enable = true;
}
