# `rust-toolchains`

This is a convenience flake for consuming Rust toolchains in [Flox](https://flox.dev).
The default Rust toolchain in Nixpkgs is the stable channel, and there are valid reasons to want to use other toolchains.
For instance, in order to cross-compile to an embedded target, you may need the `rust-std` component for that target.

Right now this flake provides three toolchains:
- `stable`: what it says on the tin.
- `nightly`: the latest nightly toolchain. This will update daily, so if you want to pin a nightly version, pin to a specific revision of this toolchain.
- `esp32-riscv-no-std`: a nightly toolchain with support for building `no_std` binaries. This toolchain only has support for ESP32-C2 and ESP32-C3 (because that's what I need support for).

PRs are welcome to configure additional toolchains (e.g. wasm) or improve existing ones.
That said, you should probably fork this and maintain your own version of it.
Depending on a random internet stranger for supply chain security is a bad idea.

## License

Licensed under either of

 * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.
