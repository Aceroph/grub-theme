# Unnamed Grub-Theme
A light & modern looking grub theme.

## Preview

I will provide a screenshot sometime.. I am NOT putting a picture from my phone.

## Installation

### On normal Distros
1. Clone the repository
```sh
$ git clone https://github.com/Aceroph/grub-theme.git
```
2. Install the files
```sh
$ mv grub-theme/theme /boot/grub/themes
```
3. Update your GRUB configuration
The GRUB configuration is allegedly located at `/etc/default/grub`
```
...
GRUB_THEME=/boot/grub/themes/grub-theme/theme.txt
...
```

### On NixOS

1. Add the input to your flake
```diff
# flake.nix

{
    description = "My flakes";

    inputs = {
        nixpkgs.url = ...;
+       grub-theme.url = "github:Aceroph/grub-theme";
    };

    outputs =
        inputs@{
            self,
            nixpkgs,
+           grub-theme,
            ...
        }:
        {
            nixosConfigurations = {
                nixos = {
+                  specialArgs = { inherit inputs; };
                };
            };
        };
}
```

2. Add the theme to your grub configuration
```diff
+ { inputs, ... }:

{
    boot.loader = {
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot/efi";
        };
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
+     theme = "${inputs.grub-theme.packages.x86_64-linux.default}/grub/themes/grub-theme";
    };
  };

}
```

## Todo
- [ ] Make the scrollbar show, it isn't for some obscur reason
- [ ] Find a better font or make it anti-aliased
- [ ] Theme the GRUB terminal

## Credits
Wow
