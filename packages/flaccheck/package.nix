{
  lib,
  rustPlatform,
  fetchFromGitHub,
  ...
}:
rustPlatform.buildRustPackage {
  pname = "flaccheck";
  version = "0.1.2";
  src = fetchFromGitHub {
    owner = "dasunNimantha";
    repo = "flaccheck";
    tag = "v0.1.2";
    hash = "sha256-fq/I3jNhddpZXClMwY17LTuxw4SJgomWosb18igNUsM=";
  };
  cargoHash = "sha256-UPjhtcBI0vdytFtCWiitRXqLd7tGqLgaxyjglePvH1Y=";
  meta = {
    description = "Detect fake FLAC files transcoded from lossy sources";
    homepage = "https://github.com/dasunNimantha/flaccheck";
    license = lib.licenses.mit;
    mainProgram = "flaccheck";
    platforms = lib.platforms.unix;
  };
}
