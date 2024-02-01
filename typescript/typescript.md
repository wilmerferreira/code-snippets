# TypeScript

TypeScript is a strongly typed programming language which builds on JavaScript giving you better tooling at any scale.

Special Files:

- `tsconfig.json`
  - `target`
  - `declaration`
  - `module`
  - `sourceMap`
- `tslint.json`

Command line tools

- `tsc`
- `tsd` (definitions)

  ```sh
  # this will download and install the typescript definition for jquery and reference it in the tsd.json
  tsd install jquery --save

  # This command will install (download) all the definition mentioned in the tsd.json
  tsd install
  ```

## Imports & exports

Allow us to _import_ different `class`es, `function`s, `constant`s, variables and even `json` data

```ts
import * as Model from './your-file-without-extension';
import YourDefaultExportMember as Model from './your-file-without-extension';
import { YourClass, YourConstant, YourEnum } as Model from './your-file-without-extension';
import YourDefaultExportMember, { YourClass, YourConstant, YourEnum } as Model from './your-file-without-extension';
import '//code.jquery.com/jquery-1.12.1.min.js';
```

## Generics

`PENDING`

## Decorators

They can be used in:

- `function`
- `class`
- `property`

```ts
// This is a function decorator
function (target: Object, methodName: string, descriptor: TypedPropertyDescriptor<Function>) {
  // ...
}
```

### Decorator's Factories

## More Information

- [Cheat Sheet](https://www.sitepen.com/blog/typescript-cheat-sheet)
- [TypeScript Playground](https://www.typescriptlang.org/play)
  - [Compiler Options](https://www.typescriptlang.org/docs/handbook/compiler-options.html)
- [TypeScript Dictionary](https://www.carlrippon.com/typescript-dictionary/)
- [TypeScript Essential Training](https://www.linkedin.com/learning/typescript-essential-training)
  - [jchadwick/EssentialTypeScript - GitHub](https://github.com/jchadwick/EssentialTypeScript)
