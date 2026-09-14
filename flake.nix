{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs (_: pkgs: import ./. { inherit pkgs; }) inputs.nixpkgs.legacyPackages;
    lib = inputs.nixpkgs.lib.extend (final: prev: import ./lib { lib = final; });
    overlays.default = final: prev: import ./. { pkgs = prev; };
  };
}
