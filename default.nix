{ sources ? import ./nix/sources.nix }:
with import sources.nixpkgs {
  overlays = import ./overlays.nix;
};

let
  cudatoolkit_joined = symlinkJoin {
    name = "${cudatoolkit.name}-unsplit";
    paths = [ cudatoolkit.out cudatoolkit.lib ];
  };

  # We do not have access to /run/opengl-driver/lib in the sandbox,
  # so use a stub instead.
  cudaStub = linkFarm "cuda-stub" [{
    name = "libcuda.so.1";
    path = "${cudatoolkit}/lib/stubs/libcuda.so";
  }];

in stdenv.mkDerivation {
  pname = "torchtest";
  version = "WIP";

  src = ./.;

  nativeBuildInputs = [ cmake ninja makeWrapper ];

  buildInputs = [ libtorch-bin cudaPackages.cudnn cudaPackages.cudatoolkit ];

  cmakeFlags = [ "-DCUDA_TOOLKIT_ROOT_DIR=${cudaPackages.cudatoolkit}" ];

  doCheck = false;

  installPhase = ''
    install -Dm755 dcgan $out/bin/dcgan

    #wrapProgram $out/bin/dcgan --prefix LD_LIBRARY_PATH : ${cudaStub}
  '';

  checkPhase = ''
    LD_LIBRARY_PATH=${cudaStub}''${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH ./dcgan
  '';
}
