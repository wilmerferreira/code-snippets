# Python: Operators

## Arithmetic Operators

| Operator  | Name              |
|-----------|-------------------|
| `+`       | Addition          |
| `-`       | Subtraction       |
| `*`       | Multiplication    |
| `/`       | Division          |
| `%`       | Modulus           |
| `**`      | Exponentiation    |
| `//`      | Floor division    |

## Assignment Operators

| Operator  | Example   | Same As       |
|-----------|-----------|---------------|
| `=`       | `x = 5`   | `x = 5`       |
| `+=`      | `x += 3`  | `x = x + 3`   |
| `-=`      | `x -= 3`  | `x = x - 3`   |
| `*=`      | `x *= 3`  | `x = x * 3`   |
| `/=`      | `x /= 3`  | `x = x / 3`   |
| `%=`      | `x %= 3`  | `x = x % 3`   |
| `//=`     | `x //= 3` | `x = x // 3`  |
| `**=`     | `x **= 3` | `x = x ** 3`  |
| `&=`      | `x &= 3`  | `x = x & 3`   |
| `|=`      | `x |= 3`  | `x = x | 3`   |
| `^=`      | `x ^= 3`  | `x = x ^ 3`   |
| `>>=`     | `x >>= 3` | `x = x >> 3`  |
| `<<=`     | `x <<= 3` | `x = x << 3`  |

## Comparison Operators

| Operator  | Name                      |
|-----------|---------------------------|
| `==`      | Equal                     |
| `!=`      | Not equal                 |
| `>`       | Greater than              |
| `<`       | Less than                 |
| `>=`      | Greater than or equal to  |
| `<=`      | Less than or equal to     |

```py
value = 5

if value <= 5:
    print('Less or equal than 5')
elif value <= 10:
    print('Less or equal than 10')
else
    print('Higher than 10')
```

## Logical Operators

| Operator  | Description                                               |
|-----------|-----------------------------------------------------------|
| `and`     | Returns True if both statements are true                  |
| `or`      | Returns True if one of the statements is true             |
| `not`     | Reverse the result, returns False if the result is true   |

## Identity Operators

| Operator  | Description                                               |
|-----------|-----------------------------------------------------------|
| `is`      | Returns True if both variables are the same object        |
| `is not`  | Returns True if both variables are not the same object    |

## Membership Operators

| Operator  | Description                                                                       |
|-----------|-----------------------------------------------------------------------------------|
| `in`      | Returns True if a sequence with the specified value is present in the object      |
| `not in`  | Returns True if a sequence with the specified value is not present in the object  |

## Bitwise Operators

| Operator  | Name                  | Description                                                                                               |
|-----------|-----------------------|-----------------------------------------------------------------------------------------------------------|
| `&`       | AND                   | Sets each bit to 1 if both bits are 1                                                                     |
| `|`       | OR                    | Sets each bit to 1 if one of two bits is 1                                                                |
| `^`       | XOR                   | Sets each bit to 1 if only one of two bits is 1                                                           |
| `~`       | NOT                   | Inverts all the bits                                                                                      |
| `<<`      | Zero fill left shift  | Shift left by pushing zeros in from the right | and let the leftmost bits fall off                        |
| `>>`      | Signed right shift    | Shift right by pushing copies of the leftmost bit in from the left, and let the rightmost bits fall off   |
