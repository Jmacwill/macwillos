{ ... }:

{
  #programs.rmpc = {
  #  enable = true;
  #};
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  #home.file.".config/rmpc/themes/theme.ron".source = ./tmp.ron;
}