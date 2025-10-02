# C# Equivalents

## Pending

- Serialization
- Http clients: `java.net.http.HttpClient` (modern) `java.net.HttpURLConnection` (legacy)
- Dependency injection
- Unit tests
- Forms
- Web APIs

## Data types

| Java      | C#                    |
|-----------|-----------------------|
| `boolean` | `bool`                |
| `byte`    | `byte` and `sbyte`    |
| `char`    | same                  |
| `short`   | `short` and `ushort`  |
| `int`     | `int` and `uint`      |
| `long`    | `long` and `ulong`    |
| `Object`  | `object`              |
| `String`  | `string`              |

## Keywords

| Java                    | C#                            | Description                                   |
|-------------------------|-------------------------------|-----------------------------------------------|
| `enum`                  | same                          |                                               |
| `final`                 | `const` and `readonly`        |                                               |
| `for`                   | same                          |                                               |
| `for (Object o : list)` | `foreach (object o in list)`  |                                               |
| `import`                | `using`                       |                                               |
| `package`               | `namespace`                   |                                               |
| `super`                 | `base`                        | Provides access to members in a parent class  |

## Libraries

| Java            | C#                | Observations  |
|-----------------|-------------------|---------------|
| `java.lang.IO`  | `System.Console`  |               |
| `System.out`    | `System.Console`  |               |
