{ sources ? import ./nix/sources.nix }:
with import sources.nixpkgs {
  overlays = [
    (import (builtins.fetchTarball https://github.com/AtilaSaraiva/myNixPythonPackages/archive/main.tar.gz))
  ];
};

stdenv.mkDerivation rec {
  pname = "torchtest";
  version = "WIP";
  src = ./.;

  nativeBuildInputs = [ cmake ninja libtorch-bin ];

  installPhase = ''
    install -Dm755 dcgan $out/bin/dcgan
  '';
}
