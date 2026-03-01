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
          format-muted = "muted";
          format-icons = {
          default = ["" "" ""];
        };
          on-click = "pwvucontrol";  # open volume control
          on-click-right = "pamixer -t";  # Right-click to mute
      };

        "tray" = {
          icon-size = "20";
          spacing = "10";
        };
      };
    };
    
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
        font-weight: bold;
      }
      
      window#waybar {
        background: transparent;
      }
      
      #workspaces button {
        padding: 0 10px;
        color: #7aa2f7;
        background: #1a1b26;
        margin: 5px 2px;
        border-radius: 10px;
      }
      
      #workspaces button.active {
        background: #7aa2f7;
	      color: #1a1b26;
      }

      #workspaces button:hover {
        background: #bb9af7;
        color: #1a1b26;
      }
      
      #clock, #battery, #network, #pulseaudio {
        padding: 0 15px;
	      color: #c0caf5;
	      margin: 5px 2px;
	      border-radius: 10px;
      }

      #clock {
        background: #7aa2f7;
        color: #1a1b26;
        font-weight: bold;
      }

      #battery {
        background: #9ece6a;
        color: #1a1b26;
      }

      #network {
        background: #bb9af7;
        color: #1a1b26;
      }

      #pulseaudio {
        background: #f7768e;
        color: #1a1b26;
      }
    '';
  };
}
