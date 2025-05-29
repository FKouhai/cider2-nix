{
  pkgs ? import <nixpkgs> { system = builtins.currentSystem; },
  appimageTools ? pkgs.appimageTools,
  lib ? pkgs.lib,
  fetchurl ? pkgs.fetchurl,
}:
appimageTools.wrapType2 rec {
  pname = "Cider";
  version = "3.0.2";

  src = fetchurl {
    url = "file://${./cider-v3.0.2-linux-x64.AppImage}";
    sha256 = "sha256-XVBhMgSNJAYTRpx5GGroteeOx0APIzuHCbf+kINT2eU=";
  };

  extraInstallCommands =
    let
      contents = appimageTools.extract { inherit pname version src; };
    in
    ''

      install -m 444 -D ${contents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${contents}/usr/share/icons $out/share
    '';

  meta = with lib; {
    description = "A new look into listening and enjoying Apple Music in style and performance.";
    homepage = "https://cider.sh/";
    maintainers = [ maintainers.nicolaivds ];
    platforms = [ "x86_64-linux" ];
  };
}
