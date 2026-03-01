# modules/home/waybar.nix - Waybar configuration in Gruvbox Dark
{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer    = "top";
        position = "top";
        height   = 32;

        modules-left   = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right  = [ "pulseaudio" "network" "battery" "tray" ];

        "hyprland/workspaces" = {
          format   = "{name}";
          on-click = "activate";
        };

        "hyprland/window" = {
          max-length = 40;
        };

        "clock" = {
          format        = "  {:%H:%M}";
          format-alt    = "  {:%a %d %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "battery" = {
          states = { warning = 30; critical = 15; };
          format           = "{icon}  {capacity}%";
          format-charging  = "  {capacity}%";
          format-icons     = [ "" "" "" "" "" ];
        };

        "network" = {
          format-wifi        = "  {essid}";
          format-ethernet    = "  Connected";
          format-disconnected = "⚠  Disconnected";
          tooltip-format     = "{ifname}: {ipaddr}";
        };

        "pulseaudio" = {
          format        = "{icon}  {volume}%";
          format-muted  = "   Muted";
          format-icons  = { default = [ "" "" "" ]; };
          on-click       = "pwvucontrol";
          on-click-right = "pamixer -t";
        };

        "tray" = {
          icon-size = 18;
          spacing   = 8;
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        font-weight: bold;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: #ebdbb2;
      }

      #workspaces button {
        padding: 0 10px;
        color: #a89984;
        background: #3c3836;
        margin: 4px 2px;
        border-radius: 10px;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        background: #fe8019;
        color: #1d2021;
      }

      #workspaces button:hover {
        background: #fabd2f;
        color: #1d2021;
      }

      #workspaces button.urgent {
        background: #fb4934;
        color: #1d2021;
      }

      #clock, #battery, #battery.charging,
      #network, #pulseaudio, #window {
        padding: 0 14px;
        margin: 4px 3px;
        border-radius: 10px;
        color: #1d2021;
      }

      #clock      { background: #fabd2f; }
      #battery    { background: #b8bb26; }
      #battery.warning  { background: #fe8019; }
      #battery.critical { background: #fb4934; color: #ebdbb2; }
      #battery.charging { background: #8ec07c; }
      #network    { background: #83a598; }
      #network.disconnected { background: #fb4934; color: #ebdbb2; }
      #pulseaudio { background: #d3869b; }
      #pulseaudio.muted { background: #504945; color: #a89984; }

      #window {
        background: #3c3836;
        color: #ebdbb2;
        font-weight: normal;
      }

      #tray { margin: 4px 3px; }
    '';
  };
}
