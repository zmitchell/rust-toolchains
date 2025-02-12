{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    fenix.url = "github:nix-community/fenix";
  };

  outputs = { self, flake-utils, fenix }:
    flake-utils.lib.eachDefaultSystem (system: 
    let
      fenixPkgs = fenix.packages.${system};
    in
    {
      packages.stable = fenixPkgs.stable.toolchain;
      packages.nightly = fenixPkgs.latest.toolchain;
      # If you want to compile no_std binaries for ESP32-C2 and ESP32-C3
      packages.esp32-riscv-no-std = fenixPkgs.combine (with fenixPkgs; [
        latest.cargo
        latest.clippy
        latest.rust-docs
        latest.rust-std
        latest.rustc
        latest.rustfmt
        latest.rust-src
        latest.llvm-tools-preview
        targets.riscv32imc-unknown-none-elf.latest.rust-std
      ]);
      packages.default = self.packages.${system}.stable;
    });
}
