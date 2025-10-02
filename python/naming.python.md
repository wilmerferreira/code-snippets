# Python: Naming Convention

| Element                                     | Convention                  | Example         |
|---------------------------------------------|-----------------------------|-----------------|
| [Projects](#project)                        | lowercase-with-hyphens      | `my-project`    |
| [Packages and Modules](#package-and-module) | lowercase_with_underscores  | `my_package`    |
| [Classes](#classes)                         | PascalCase                  | `MyClass`       |
| [Function](#functions)                      | snake_case                  | `my_function()` |
| [Variable](#variables)                      | snake_case                  | `my_variable`   |
| [Constant](#constants)                      | UPPER_SNAKE_CASE            | `MY_CONSTANT`   |
| [Private](#private-and-internal-names)      | _leading_underscore         | `_private_var`  |

## File System

### Projects

`lowercase-with-hyphens` (for distribution)
Example: `my-awesome-project`

### Package and Module

`lowercase_with_underscores` (snake_case)
Prefer short, all-lowercase names
Underscores discouraged but allowed if it improves readability
Examples: `requests`, `numpy`, `my_package`, `data_processing`

### File Names

`lowercase_with_underscores.py` (snake_case)
Should be valid Python identifiers (importable)
Examples: `utils.py`, `data_handler.py`, `__init__.py`

## Code

### Classes

`PascalCase` (CapWords)
Examples: `MyClass`, `DataProcessor`, `HTTPServer`
Exception classes: end with `Error` (e.g., `ValidationError`)

## Functions

`lowercase_with_underscores` (snake_case)
Examples: `get_data()`, `calculate_total()`, `process_user_input()`

## Variables

`lowercase_with_underscores` (snake_case)
Examples: `user_name`, `total_count`, `is_valid`

## Constants

`UPPERCASE_WITH_UNDERSCORES` (SCREAMING_SNAKE_CASE)
Module-level constants
Examples: `MAX_SIZE`, `DEFAULT_TIMEOUT`, `API_KEY`

## Private and Internal Names

`_single_leading_underscore`
Weak "internal use" indicator
Examples: `_internal_function()`, `_helper_method()`

## Special Cases

### Name Mangling (Class Private)

`__double_leading_underscore`
Used to avoid name conflicts in subclasses
Example: `__private_attr`

### Magic Methods

`__double_underscore_both_sides__`
Reserved for Python special methods
Examples: `__init__()`, `__str__()`, `__repr__()`
