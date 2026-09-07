{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs (_: pkgs: import ./. { inherit pkgs; }) inputs.nixpkgs.legacyPackages;

    overlays.default = final: prev: import ./. { inherit prev; };
  };
}
