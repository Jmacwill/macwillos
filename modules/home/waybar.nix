# modules/home/waybar.nix - Waybar in Dracula Pro
{ ... }:

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
          format = "{name}"; on-click = "activate";
        };
        "hyprland/window" = { max-length = 40; };
        "clock" = {
          format = "  {:%H:%M}"; format-alt = "  {:%a %d %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "battery" = {
          states = { warning = 30; critical = 15; };
          format = "{icon}  {capacity}%"; format-charging = "  {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };
        "network" = {
          format-wifi = "  {essid}"; format-ethernet = "  Connected";
          format-disconnected = "⚠  Disconnected"; tooltip-format = "{ifname}: {ipaddr}";
        };
        "pulseaudio" = {
          format = "{icon}  {volume}%"; format-muted = "   Muted";
          format-icons = { default = [ "" "" "" ]; };
          on-click = "pwvucontrol"; on-click-right = "pamixer -t";
        };
        "tray" = { icon-size = 18; spacing = 8; };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px; font-weight: bold;
        border: none; border-radius: 0; min-height: 0;
      }
      window#waybar { background: transparent; color: #F8F8F2; }

      #workspaces button {
        padding: 0 10px; color: #F8F8F2; background: #3A3652;
        margin: 4px 2px; border-radius: 10px; transition: all 0.2s ease;
      }
      #workspaces button.active  { background: #9580FF; color: #22212C; }
      #workspaces button:hover   { background: #FF80BF; color: #22212C; }
      #workspaces button.urgent  { background: #FF9580; color: #22212C; }

      #clock, #battery, #battery.charging,
      #network, #pulseaudio, #window {
        padding: 0 14px; margin: 4px 3px; border-radius: 10px; color: #22212C;
      }

      #clock      { background: #9580FF; }
      #battery    { background: #8AFF80; }
      #battery.warning  { background: #FFCA80; }
      #battery.critical { background: #FF9580; color: #22212C; }
      #battery.charging { background: #80FFEA; }
      #network    { background: #80FFEA; }
      #network.disconnected { background: #FF9580; color: #22212C; }
      #pulseaudio { background: #FF80BF; }
      #pulseaudio.muted { background: #3A3652; color: #F8F8F2; }
      #window { background: #3A3652; color: #F8F8F2; font-weight: normal; }
      #tray { margin: 4px 3px; }
    '';
  };
}
