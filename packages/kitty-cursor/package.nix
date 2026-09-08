{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "kitty-cursor";
  version = "1.0";
  src = ./assets/kitty-cursor;

  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/kitty-cursor
    cp -r cursors index.theme $out/share/icons/kitty-cursor/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Kitty cursor theme by Noiire";
    homepage = "https://ko-fi.com/s/f6bb8df93b";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
