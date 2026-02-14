# system/configuration.nix - System-level configuration
{ config, pkgs, inputs, machineConfig, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking - automatically uses the machine's hostname
  networking.hostName = machineConfig.hostname;
  networking.networkmanager.enable = true;

  # Time zone - automatically uses the machine's timezone
  time.timeZone = machineConfig.timezone;
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # XDG portal for screen sharing, etc.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User account - automatically uses the machine's username
  users.users.${machineConfig.username} = {
    isNormalUser = true;
    description = "Your Name";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    wget
    git
    neovim
    brave
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages (if needed)
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release
  system.stateVersion = "24.05"; # Don't change this!
}
