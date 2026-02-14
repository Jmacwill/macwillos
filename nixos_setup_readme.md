# NixOS Modular Configuration

A portable, modular NixOS setup with Hyprland and Home Manager that works across multiple machines.

## Directory Structure

```
~/.config/nixos/  (or wherever you want)
├── flake.nix                    # Main entry point - EDIT MACHINES HERE
├── flake.lock                   # Locked dependency versions
├── system/
│   ├── configuration.nix        # Shared system settings
│   └── hyprland.nix            # Hyprland system configuration
├── home/
│   ├── home.nix                # Shared user settings
│   └── hyprland.nix            # Hyprland user configuration
└── hosts/
    ├── desktop/
    │   └── hardware-configuration.nix
    ├── laptop/
    │   └── hardware-configuration.nix
    └── ... (one folder per machine)
```

## Adding a New Machine

### 1. Edit `flake.nix`

Add your machine to the `machines` section:

```nix
machines = {
  desktop = {
    hostname = "desktop";
    username = "yourname";
    timezone = "America/New_York";
  };
  
  # Add new machine here:
  work-laptop = {
    hostname = "work-laptop";
    username = "yourname";
    timezone = "America/Los_Angeles";
  };
};
```

### 2. Create the host directory and hardware config

```bash
# Create the directory
mkdir -p hosts/work-laptop

# Generate hardware config
sudo nixos-generate-config --show-hardware-config > hosts/work-laptop/hardware-configuration.nix
```

### 3. Build!

```bash
sudo nixos-rebuild switch --flake .#work-laptop
```

That's it! The hostname, username, and timezone are automatically configured.

## Initial Setup on First Machine

```bash
# 1. Create your config directory
mkdir -p ~/.config/nixos
cd ~/.config/nixos

# 2. Create the files (flake.nix, system/configuration.nix, home/home.nix)

# 3. Edit flake.nix and add your first machine to the machines list

# 4. Create the host directory
mkdir -p hosts/desktop  # or whatever you named it

# 5. Generate hardware config
sudo nixos-generate-config --show-hardware-config > hosts/desktop/hardware-configuration.nix

# 6. Update git info in home/home.nix

# 7. Build
sudo nixos-rebuild switch --flake .#desktop
```

## Moving to a New Machine

```bash
# 1. Clone your repo
git clone <your-repo-url> ~/.config/nixos
cd ~/.config/nixos

# 2. Edit flake.nix - add the new machine to the machines list

# 3. Create host directory and generate hardware config
mkdir -p hosts/new-machine
sudo nixos-generate-config --show-hardware-config > hosts/new-machine/hardware-configuration.nix

# 4. Build
sudo nixos-rebuild switch --flake .#new-machine

# 5. Commit and push the hardware config
git add hosts/new-machine/
git commit -m "Add new-machine configuration"
git push
```

## Machine-Specific Customization

If you need different packages or settings for specific machines, create:

`hosts/machine-name/configuration.nix`:
```nix
{ pkgs, ... }:
{
  # Machine-specific system settings
  environment.systemPackages = with pkgs; [
    # Extra packages just for this machine
  ];
}
```

Then import it in `flake.nix` by adding to the modules list for that machine.

## Useful Commands

```bash
rebuild         # Rebuild system (automatically uses correct hostname)
update          # Update flake inputs
nix flake update # Update all dependencies
```

## What Gets Shared vs Machine-Specific

**Shared (same on all machines):**
- System packages and settings (`system/configuration.nix`)
- User packages and configs (`home/home.nix`)
- Hyprland, Neovim setup

**Machine-specific:**
- Hardware configuration (automatically)
- Hostname (set in flake.nix)
- Username (set in flake.nix)
- Timezone (set in flake.nix)

## Benefits of This Setup

✅ **One repo, many machines** - Just edit the machines list in flake.nix  
✅ **Automatic configuration** - Hostname, username, timezone set per machine  
✅ **Easy to add machines** - Just add to the list and generate hardware config  
✅ **Shared configs** - Common settings in one place  
✅ **Git-friendly** - Each machine's hardware config in its own folder  

## Hyprland Configuration

Hyprland is now fully configured with:

**System level** (`system/hyprland.nix`):
- Thunar file manager with all required plugins
- Screenshot tools (grim, slurp)
- Brightness and media controls
- Auto-login via greetd
- All necessary system packages

**User level** (`home/hyprland.nix`):
- Complete Hyprland configuration with keybindings
- Waybar status bar with system info
- Wofi app launcher
- Auto-start applications

**Default Keybindings:**
- `SUPER + RETURN` - Open terminal (kitty)
- `SUPER + D` - App launcher (wofi)
- `SUPER + E` - File manager (thunar)
- `SUPER + Q` - Close window
- `SUPER + M` - Exit Hyprland
- `SUPER + F` - Fullscreen
- `SUPER + 1-9` - Switch workspace
- `SUPER + SHIFT + 1-9` - Move window to workspace
- `Print` - Screenshot selection
- `SHIFT + Print` - Screenshot full screen
- Arrow keys for window focus/movement

Edit `home/hyprland.nix` to customize keybindings, appearance, and behavior!

## Next Steps

1. Customize shared settings in `system/configuration.nix` and `home/home.nix`
2. Add machine-specific configs if needed
3. Push to GitHub for true portability
4. Configure Hyprland and Neovim to your liking
