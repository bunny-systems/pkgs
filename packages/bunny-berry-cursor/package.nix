{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "bunny-berry-cursor";
  version = "1.0";
  src = ./assets/bunny-berry-cursor;

  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/bunny-berry-cursor
    cp -r cursors index.theme $out/share/icons/bunny-berry-cursor/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Bunny Berry cursor theme by Noiire";
    homepage = "https://ko-fi.com/s/dff83d9540";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
