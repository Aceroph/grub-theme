{
  description = "The GRUB theme I've made for my configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux = rec {
        grub-theme = pkgs.callPackage ./default.nix { };
        default = grub-theme;
      };
    };
}
