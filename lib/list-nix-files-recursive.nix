{ lib }:
dir:
let
  inherit (builtins) filter;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasSuffix hasPrefix;

  files = map toString (listFilesRecursive dir);
in
filter (
  file:
  hasSuffix ".nix" file && baseNameOf file != "default.nix" && !(hasPrefix "_" (baseNameOf file))
) files
