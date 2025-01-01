{ pkgs }: pkgs.stdenv.mkDerivation {
  pname = "sddm-theme";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "8993670e73d36f4e8edc70d13614fa05edc2575c";
    sha256 = "0pjf12x6420rnrbj7q059szfpswcy7y8srsij6dg513fkzj5fimq";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -r $src $out/share/sddm/themes/sddm-astronaut-theme
  '';
}
