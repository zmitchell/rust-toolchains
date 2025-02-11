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
      packages.nightly = fenixPkgs.default.toolchain;
      # If you want to compile no_std binaries for ESP32-C2 and ESP32-C3
      packages.esp32-riscv-no-std = fenixPkgs.combine (with fenixPkgs; [
        default.cargo
        default.clippy
        default.rust-docs
        default.rust-std
        default.rustc
        default.rustfmt
        stable.rust-src
        stable.llvm-tools
        targets.riscv32imc-unknown-none-elf.stable.rust-std
      ]);
      packages.default = self.packages.${system}.stable;
    });
}
