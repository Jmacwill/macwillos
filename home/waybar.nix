{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];
        
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
        };
        
        "battery" = {
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
        };
        
        "network" = {
          format-wifi = "{essid} ";
          format-ethernet = "Connected ";
          format-disconnected = "Disconnected ⚠";
        };
        
        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            default = ["" "" ""];
          };
        };
      };
    };
    
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }
      
      window#waybar {
        background-color: rgba(26, 27, 38, 0.9);
        color: #ffffff;
      }
      
      #workspaces button {
        padding: 0 10px;
        color: #ffffff;
      }
      
      #workspaces button.active {
        background-color: rgba(255, 255, 255, 0.2);
      }
      
      #clock, #battery, #network, #pulseaudio, #tray {
        padding: 0 10px;
      }
    '';
  };
}
