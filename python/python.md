# Python

- Is Case sensitive
- Use the `\` character to split the comments

## Configuration

- `pyproject.toml`

  ```toml
  [project]
  name = "example-package"
  version = "0.1.0"
  description = "An example Python package"
  dependencies = ["requests", "numpy"]
  ```

- `requirements.txt`

  ```txt
  beautifulsoup4==4.12.2
  requests==2.28.2
  ```

## Comments

- Single line comments

  ```py
  # This is a single line comment
  ```

- Multi-line comments

  ```py
  # This is a
  # multi line comment
  
  """
  This is a comment
  written in
  more than just one line
  """
  ```

  > The second option is not quite as intended, you can use a multiline string. Since Python will ignore string literals that are not assigned to a variable, you can add a multiline string (triple quotes) in your code, and place your comment inside it

## Data Types

| Category          | Type                                  |
|-------------------|---------------------------------------|
| Text Type         | `str`                                 |
| Numeric Types     | `int`, `float`, `complex`             |
| Sequence Types    | `list`, `tuple`, `range`              |
| Mapping Type      | `dict`                                |
| Set Types         | `set`, `frozenset`                    |
| Boolean Type      | `bool`                                |
| Binary Types      | `bytes`, `bytearray`, `memoryview`    |

### Casting

- `bool(object)`
- `float(object)`
- `int(object)`
- `str(object)`

## String Interpolation

[Python String Formatting](https://www.w3schools.com/python/python_string_formatting.asp)

- _f-strings_

  ```py
  name = 'World'
  program = 'Python'
  print(f'Hello {name}! This is {program}')
  ```

- _%-formatting_

  ```py
  print("%s %s" %('Hello','World',)) # This will print: Hello World
  ```

- _str.format()_

  ```py
  name = 'world'
  print('Hello, {}'.format(name)) # This will print: Hello, world
  ```

- _Template Strings_

  ```py
  from string import Template
  name = 'world'
  program = 'python'
  new = Template('Hello $name! This is $program.')
  
  # This will print: Hello world! This is python.
  print(new.substitute(name=name, program=program))
  ```

To import a library

```py
import math
```

Divisions

```py
division = 9 / 2  # this will return 4.5
integer_division = 9 // 2  # this will return 4
```

## Common functions

- `print()`
- `str()`
- `int()`
- `len()`
- `input()`
- [range()](https://www.python.org/dev/peps/pep-0281/)
- `format()`
- `strip()`: will remove extra spaces or newline characters
- `random()`
  - `choice()`
  - `randint()`
  - `random()`
- `open(file, mode)`, e.g. ```open('orders.txt', 'w')``` the modes are **w** for write, **a** for append, **r** for read
  - `write(content)`
  - `read()`
  - `readline()`
  - `close()`
- `type(object)`: this returns the type of an object

## Functions

```py
def functionName(parameters):
  "function_docstring"
  function_suite
  return [expression]
```

[Python Functions](https://www.tutorialspoint.com/python/python_functions.htm)

- Function docstring
- Keyword arguments
- Default arguments
- Variable-length arguments (Tuple)
- The Anonymous Functions

## Utility Functions

- [List Comprehensions](https://docs.python.org/2/tutorial/datastructures.html#list-comprehensions)

```py
range_list = [i for i in range(0, 10)]
square_list = [(i + 1) ** 2 for i in range(0, 10)]
```

- [Dict Comprehensions](https://www.python.org/dev/peps/pep-0274/)

## Exceptions

```py
try:
  # your code will be here
except:
  # your error handler will be here
```

```py
try:
  # ...
except ValueError: # using an specific type of error
  # ...
```

```py
try:
  # ...
except ValueError as error: # Capturing the error information in the 'error' variable
  # ...
```

## More Information

- [Difference between List VS Set VS Tuple in Python](https://www.geeksforgeeks.org/difference-between-list-vs-set-vs-tuple-in-python/)
- [Python CheatSheet](https://www.pythoncheatsheet.org/cheatsheet)
- [Python Tutorial](https://www.pythontutorial.net/)
- [Projects - Raspberry Pi](https://projects.raspberrypi.org/en/paths)
- [Sense HAT Emulator](https://sense-emu.readthedocs.io/)
