with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "torchtest";
  version = "WIP";
  src = ./.;

  nativeBuildInputs = [ cmake ninja libtorch-bin ];

  installPhase = ''
    install -Dm755 dcgan $out/bin/dcgan
  '';
}
