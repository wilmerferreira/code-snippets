# Rust

## Prerequisites

- [Rust](https://www.rust-lang.org/tools/install)

  ```sh
  winget install Rustlang.Rustup
  ```

## IDEs

- [RustRover](https://www.jetbrains.com/rust/)

  ```sh
  winget install JetBrains.RustRover
  ```

- [Visual Studio Code](https://code.visualstudio.com/docs/languages/rust)

## Project types

- Binaries

  ```sh
  cargo new my_binary
  ```

- Library

  ```sh
  cargo new --lib my_lib
  ```

## Naming Convention

Use _CamelCase_ for:

```rs
struct UnitStruct;

struct TupleStruct(T); // ... with generic type T

struct StructName {
  field: NamedTuple,
}

enum EnumName {
  VariantName,
}

type TypeAlias = u8;

trait TraitName {}
```

Use _snake_case_ for:

```rs
// Attributes
#![attribute_name]

// Variables
let variable_name = true;

// Functions
fn function_name() {
    function_call();
}

// Macros
macro_name!();
macro_name![];
macro_name! {};
```

use _UPPER_SNAKE_CASE_ for:

```rs
const EIGHTY_EIGHT: u32 = 88;
```
