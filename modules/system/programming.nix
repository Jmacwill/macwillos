# modules/system/configuration.nix - System-level configuration
{ pkgs, ... }:
{
  #programming linkages
  programs.nix-ld.enable = true;   #required for programming ESP32 with PlatfomIO

  # Packages for Programming
  environment.systemPackages = with pkgs; [
    esptool
  ];
}
  