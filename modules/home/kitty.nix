# modules/home/kitty.nix - Kitty terminal in Dracula Pro
{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      foreground = "#F8F8F2";
      background = "#22212C";

      color0  = "#22212C"; color8  = "#3A3652";  # black
      color1  = "#FF9580"; color9  = "#FF9580";  # red
      color2  = "#8AFF80"; color10 = "#8AFF80";  # green
      color3  = "#FFCA80"; color11 = "#FFFF80";  # yellow
      color4  = "#9580FF"; color12 = "#9580FF";  # blue/purple
      color5  = "#FF80BF"; color13 = "#FF80BF";  # magenta/pink
      color6  = "#80FFEA"; color14 = "#80FFEA";  # cyan
      color7  = "#F8F8F2"; color15 = "#FFFFFF";  # white

      cursor            = "#FF80BF";
      cursor_text_color = "#22212C";
      selection_background = "#3A3652";
      selection_foreground = "#F8F8F2";

      font_family      = "JetBrainsMono Nerd Font";
      bold_font        = "JetBrainsMono Nerd Font Bold";
      italic_font      = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
      font_size        = "12.0";

      window_padding_width    = 8;
      hide_window_decorations = "yes";
      background_opacity      = "0.92";
      enable_audio_bell       = "no";
    };
  };
}
