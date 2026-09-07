let
  lock = builtins.fromJSON (builtins.readFile ./flake.lock);
  nixpkgs = fetchTarball {
    inherit (lock.nodes.nixpkgs.locked) url;
    sha256 = lock.nodes.nixpkgs.locked.narHash;
  };
in
{
  pkgs ? import nixpkgs { },
}:
let
  inherit (pkgs.lib) callPackageWith fix packagesFromDirectoryRecursive;
in
fix (
  self:
  packagesFromDirectoryRecursive {
    callPackage = callPackageWith (pkgs // self);
    directory = ./packages;
  }
)
