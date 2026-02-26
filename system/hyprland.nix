# system/hyprland.nix - Hyprland system configuration
{ config, pkgs, inputs, ... }:

{
  # Enable Hyprland
  #programs.hyprland = {
  #  enable = true;
  #  withUWSM = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    # disabled to let it pull the nixpkgs versions
  #  xwayland.enable = true;
#  };

  # XDG portal for screen sharing, file picking, etc.
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

  # Link to Portal Paths
  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
  
  # Required system packages for Hyprland
  environment.systemPackages = with pkgs; [
    # File manager
    thunar
    thunar-volman  # Removable device management
    tumbler        # Thumbnail support
    
    # Screenshot and screen recording
    grim                # Screenshot tool
    slurp               # Screen area selector
    wl-clipboard        # Clipboard utilities
    
    # System utilities
    brightnessctl       # Screen brightness control
    playerctl           # Media player control
    pamixer             # Audio control
    
    # Network management
    networkmanagerapplet
  ];

  # Enable display manager to auto-login to Hyprland
  services.greetd = {
    enable = true;
    settings = {
    #  initial_session = {
    #    command = "${pkgs.hyprland}/bin/Hyprland";
    #    user = "jonathan";
    #  };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland --user-menu";
        user = "greeter";
      };
    };
  };

  # Polkit (for privilege escalation - needed for things like system settings)
  security.polkit.enable = true;
  
  # Enable GVFS (for file manager features like network shares, trash, etc.)
  services.gvfs.enable = true;
}
