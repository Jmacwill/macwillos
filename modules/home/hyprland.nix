# modules/home/hyprland.nix - Hyprland user configuration via Home Manager
{ config, pkgs, ... }:

# ─── Gruvbox Dark Colour Palette ─────────────────────────────────────────────
# bg       #282828   bg_hard  #1d2021   bg1      #3c3836   bg2      #504945
# fg       #ebdbb2   orange   #fe8019   yellow   #fabd2f
# green    #b8bb26   aqua     #8ec07c   blue     #83a598   purple   #d3869b
# ─────────────────────────────────────────────────────────────────────────────

{
  imports = [
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      windowrule = float on, match:class com.saivert.pwvucontrol
      windowrule = size 800 600, match:class com.saivert.pwvucontrol
      windowrule = pin on, match:class com.saivert.pwvucontrol
      windowrule = float on, match:class thunar
    '';

    settings = {
      "$mod" = "SUPER";

      monitor = [ ",preferred,auto,1" ];

      exec-once = [
        "waybar"
        "dunst"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border"   = "rgba(fe8019ee) rgba(fabd2fee) 45deg";
        "col.inactive_border" = "rgba(3c3836aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        blur = {
          enabled    = true;
          size       = 5;
          passes     = 2;
          noise      = 0.0117;
          contrast   = 0.8916;
          brightness = 0.8;
        };
        shadow = {
          enabled      = true;
          range        = 12;
          render_power = 3;
          color        = "rgba(1d2021cc)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutExpo, 0.16, 1.0, 0.3, 1.0"
          "easeOutBack, 0.34, 1.56, 0.64, 1.0"
          "linear,      0.0,  0.0,  1.0, 1.0"
        ];
        animation = [
          "windows,     1, 5, easeOutExpo, slide"
          "windowsOut,  1, 4, easeOutExpo, popin 80%"
          "border,      1, 8, default"
          "borderangle, 1, 30, linear, loop"
          "fade,        1, 5, easeOutExpo"
          "workspaces,  1, 5, easeOutBack, slide"
        ];
      };

      dwindle = {
        pseudotile     = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper     = 0;
        animate_mouse_windowdragging = true;
      };

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, D, exec, wofi --show drun"
        "$mod, E, exec, thunar"
        "$mod, W, exec, brave"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, V, togglefloating"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "$mod, F, fullscreen"
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"
        "$mod SHIFT, left,  movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up,    movewindow, u"
        "$mod SHIFT, down,  movewindow, d"
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
        ", Print,      exec, grim -g \"$(slurp)\" - | wl-copy"
        "SHIFT, Print, exec, grim - | wl-copy"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioRaiseVolume,  exec, pamixer -i 5"
        ", XF86AudioLowerVolume,  exec, pamixer -d 5"
        ", XF86AudioMute,         exec, pamixer -t"
        ", XF86AudioPlay,         exec, playerctl play-pause"
        ", XF86AudioNext,         exec, playerctl next"
        ", XF86AudioPrev,         exec, playerctl previous"
        ", XF86MonBrightnessUp,   exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
    };
  };
}
