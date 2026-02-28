# home/hyprland.nix - Hyprland user configuration via Home Manager
{ config, pkgs, ... }:

{
  # Imports

  imports = [
    ./waybar.nix
  ];

  # Hyprland configuration
  wayland.windowManager.hyprland = {
    enable = true;

    # windows rules
    extraConfig = ''
      windowrule = float on, match:class com.saivert.pwvucontrol
      windowrule = size 800 600, match:class com.saivert.pwvucontrol
      windowrule = pin on, match:class com.saivert.pwvucontrol
      windowrule = float on, match:class thunar
      '';

    settings = {
      # Modifier key (Mod4 = Super/Windows key)
      "$mod" = "SUPER";
      
      # Monitor configuration (adjust for your setup)
      monitor = [
        ",preferred,auto,1"  # Auto-configure all monitors
      ];
      
      # Autostart applications
      exec-once = [
        "waybar"
        "dunst"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
      ];
      
      # Input configuration
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0;
      };
      
      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      
      # Decorations
      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
#        "drop.shadow" = true;
#        "shadow.range" = 4;
#        shadow_render_power = 3;
#        "col.shadow" = "rgba(1a1a1aee)";
      };
      
      # Animations
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      
      # Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      
      # Window rules  (commented out do to change in systax)
   #   windowrule = [
   #     "float,class:^(pwvucontrol)$"
   #     "float,class:^(thunar)$"
   #    ];
      
      # Keybindings
      bind = [
        # Application launchers
        "$mod, RETURN, exec, kitty"
        "$mod, D, exec, wofi --show drun"
        "$mod, E, exec, thunar"
        "$mod, W, exec, brave"

        # Window management
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, V, togglefloating"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "$mod, F, fullscreen"
        
        # Focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        
        # Move windows
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"
        
        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        
        # Move to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        
        # Screenshots
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "SHIFT, Print, exec, grim - | wl-copy"
      ];
      
      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      
      # Volume and brightness keys
      bindl = [
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
    };
  };
  
}
