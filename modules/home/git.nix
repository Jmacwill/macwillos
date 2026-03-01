# /modules/home/git.nix - User-level configuration with Home Manager
{ ... }:

{

  # Git configuration
  programs.git = {
    enable = true;
    settings = {
      user.Name = "jmacwill";
      user.Email = "jonathan.macwilliams@gmail.com";
    };
  };
}
