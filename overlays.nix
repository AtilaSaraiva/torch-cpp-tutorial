[
  (self: super: {
    libtorch-bin = super.libtorch-bin.override {
      cudaSupport = true;
    };
  })
]
