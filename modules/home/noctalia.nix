# /modules/home/noctalia.nix - User-level configuration with Home Manager

{ pkgs, inputs, ... }:

{
  home-manager.users.drfoobar = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
  };
}