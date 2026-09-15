# bunnypkgs

A curated set of packages made by an indulgent circle of Nix/NixOS users. This repository mainly serves as an experimental ground for learning, as well as packaging stuff we find useful/cool that has not yet made its way to `nixpkgs`.

## Usage

Try out `bunnyfetch` in bunnypkgs by running following command (requires flakes):

```sh
nix run github:bunny-systems/pkgs#bunnyfetch
```
Feel free to substitute `bunnyfetch` with whatever package desired.

Alternatively, you can add bunnypkgs as a flake input to your nix config's `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Add this input to your flake
    bunnypkgs.url = "github:bunny-systems/pkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.your-hostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        # rest of your config here
      ];
    };
  };
}
```

Then, in your `configuration.nix`:
```nix
nixpkgs.overlays = [inputs.bunnypkgs.overlays.default];
```

You can then use bunnypkgs like so:
```nix
environment.systemPackages = with pkgs; [
  bunnyfetch
  # other packages go here
];
```
