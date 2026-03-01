# modules/system/hyprland.nix - System-level Hyprland configuration
# Handles portals, display manager, polkit — things that need root/system access
# User-facing Hyprland config (keybinds, appearance) lives in home/hyprland/
{ config, pkgs, inputs, ... }:

{
  # XDG desktop portals — enable screen sharing, file picking, etc. for Wayland apps
  # Both hyprland and gtk portals are listed so GTK apps fall back gracefully
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [ "hyprland" "gtk" ];
      };
      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
      };
    };
  };

  # Ensure portal and application paths are available system-wide
  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  # System packages required by Hyprland and its ecosystem
  environment.systemPackages = with pkgs; [
    # File manager
    thunar
    thunar-volman  # Removable device management
    tumbler        # Thumbnail generation for Thunar

    # Screenshot tools (used in keybinds: grim captures, slurp selects region)
    grim
    slurp
    wl-clipboard   # Wayland clipboard (wl-copy / wl-paste)

    # Hardware controls (invoked by Hyprland bindl keybinds)
    brightnessctl  # Screen brightness
    playerctl      # Media player control (play/pause/next/prev)
    pamixer        # Audio volume

    # Network management tray applet
    networkmanagerapplet

    # Hyprland Wallpaper packages
    hyprpaper
  ];

  # Display manager: tuigreet shows a TUI login prompt, then launches Hyprland
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland --user-menu";
        user = "greeter";
      };
    };
  };

  # Polkit — required for privilege escalation dialogs (e.g. mounting drives, system settings)
  security.polkit.enable = true;

  # GVFS — gives Thunar network share browsing, trash support, and MTP device access
  services.gvfs.enable = true;
}
