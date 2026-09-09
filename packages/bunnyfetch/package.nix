{
  lib,
  stdenvNoCC,
  pkgs,
  makeWrapper,
  fastfetch,
}:
let
  cfg = pkgs.writeText "bunnyfetch.jsonc" ''
        {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "display": {
        "bar": {
          "border": null,
          "char": {
            "elapsed": "●",
            "total": "○"
          },
          "width": 18
        },
        "percent": {
          "type": [
            "num",
            "bar",
            "bar-monochrome"
          ]
        },
        "separator": "    "
      },
      "logo": {
        "color": {
          "1": "magenta"
        },
        "height": 1,
        "padding": {
          "left": 1,
          "top": 0
        },
        "source": " (\\(\\\n (^.^ )\no(\")(\")\n\n\n (\\(\\\n ( -.-)\no_(\")(\")\n\n\n (\\(\\   Z\n (=.=) z\no_(\")(\")\n\n\n(\\(\\\n(='.'=)\n(\")_(\")\n",
        "type": "data",
        "width": 1
      },
      "modules": [
        {
          "format": "✿ {user-name}@{host-name} ✿",
          "keyColor": "35;1",
          "outputColor": "35;1",
          "type": "title"
        },
        {
          "format": "✦ ✦ ✦ ✦ ✦ ✦ ✦ ✦ ✦",
          "keyColor": "34;1",
          "outputColor": "34;1",
          "type": "custom"
        },
        {
          "format": "{3}",
          "key": "{icon} Burrow OS       ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "os"
        },
        {
          "format": "{2}h {3}m",
          "key": "󰅐 Hoptime         ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "uptime"
        },
        {
          "format": "{1} {2}",
          "key": " Warren kernel   ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "kernel"
        },
        {
          "key": " Carrot stash    ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "packages"
        },
        {
          "format": "{2}",
          "key": "󰇄 Cozy den        ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "de"
        },
        {
          "format": "{1} {5}",
          "key": "󰖲 Blank Burrow    ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "wm"
        },
        {
          "format": "{1} {6}",
          "key": " Whisker Terminal",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "terminal"
        },
        {
          "format": "{1} {4}",
          "key": " Burrow shell    ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "shell"
        },
        {
          "format": "{1} ({4} paws)",
          "key": " Bunny brains    ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "cpu"
        },
        {
          "format": "{4} ({1} / {2})",
          "key": " Fluffy Level    ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "memory"
        },
        {
          "folders": "/",
          "format": "{13} ({1} / {2})",
          "key": "󰋊 Burrow space    ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "disk"
        },
        {
          "format": "✿ thumpthump~, bunny is awake ✿",
          "key": " Nibble note     ",
          "keyColor": "34;1",
          "outputColor": "1;1",
          "type": "custom"
        },
        {
          "format": "✦ ✦ ✦ ✦ ✦ ✦ ✦ ✦ ✦",
          "keyColor": "34;1",
          "outputColor": "34;1",
          "type": "custom"
        },
        "break",
        {
          "format": "♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥",
          "outputColor": "35;1",
          "type": "custom"
        },
        {
          "symbol": "circle",
          "type": "colors"
        },
        {
          "format": "✿ thumpthump~ have a fluffy day ✿",
          "outputColor": "35;1",
          "type": "custom"
        }
      ]
    }  '';
in
stdenvNoCC.mkDerivation {
  pname = "bunnyfetch";
  version = "1.0";

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ pkgs.fastfetch ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    makeWrapper ${fastfetch}/bin/fastfetch $out/bin/bunnyfetch \
      --add-flags "--config ${cfg}"
    runHook postInstall
  '';

  meta = with lib; {
    description = "Bunnyfetch, a custom fastfetch configuration";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
