# Rust: Cargo

## Cargo Commands

```sh
cargo new           # Create a new binary executable crate
cargo new --lib     # Create a new library crate

cargo build         # Compiles our crate
cargo build --release # Compiles our crate with optimizations
cargo run           # Compiles our crate and runs the compiled executable

cargo test          # Run all tests in a crate
cargo doc --open    # Build and open our crate's documentation in a web browser
cargo clean         # Cleans up temporary files created during compilation
cargo publish       # Publishes your crate to `crates.io`

cargo install       # Installs a binary directly from crates.io
```

## Manifest

The default manifest file is created as `Cargo.toml`, this helps to manage dependencies, compilation options, and package metadata, and is crucial when uploading your project to [crates.io](https://crates.io).

```toml
[package]
name = "mybinary"
version = "0.1.0"
edition = "2021"

[dependencies]
# We can specify external dependencies here
```

> The edition field denotes which _Rust Edition_ the crate utilizes. Rust Editions are not the same as `rustc` compiler versions. Editions are released every few years and are intended mainly for backwards incompatible changes to the language.

Here is an overview of some of the most commonly encountered fields:

```toml
[package]
name = "mybinary"  # The crate name
version = "0.1.0"  # The crate's current version
edition = "2021"   # Which "Rust Edition" the crate utilizes

description = ""   # A description of our crate for `crates.io`
keywords = ""   # Keywords for searches on `crates.io`
documentation = "" # URL to the crate's documentation
homepage = ""   # URL to the crate's homepage
repository = "" # URL of the crate's source repository
authors = [""]  # The authors of the crate
license = ""    # The crate's license
rust-version = ""  # The minimum supported Rust version
```

## More Information

- [The Manifest Format - The Cargo Book](https://doc.rust-lang.org/cargo/reference/manifest.html)
- [TOML - Tom's Obvious Minimal Language](https://toml.io/en/)
