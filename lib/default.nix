# Library of low-level helper functions for nix expressions which are not found in nixpkgs.
{ lib, ... }:
let
  callLibs = file: import file { inherit lib; };
in
{
  # modules system
  listNixFilesRecursive = callLibs ./list-nix-files-recursive.nix;
}
