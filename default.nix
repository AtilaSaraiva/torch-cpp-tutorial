with import <nixpkgs> {};

stdenv.mkDerivation rec {
  src = ./.;

  nativeBuildInputs = [ cmake ninja libtorch-bin ];
}
