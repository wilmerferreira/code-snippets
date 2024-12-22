# Javascript: Linq Equivalents for JavaScript Arrays

| Linq              | Javascript            |
|-------------------|-----------------------|
| `Aggregate`       | `reduce`              |
| `All`             | `every`               |
| `Any`             | `some`                |
| `Append`          | `push`                |
| `Concat`          | `concat`              |
| `FirstOrDefault`  | `find` or `includes`  |
| `ForEach`         | `forEach`             |
| `OrderBy`         | `sort`                |
| `Reverse`         | `reverse`             |
| `Select`          | `map`                 |
| `Where`           | `filter`              |

## Examples

### Aggregate

```cs
const numbers = new int[] { 1, 2, 3, 4, 5 };
const sumTotal = numbers.Aggregate(0, (accumulator, number) => accumulator + number);
```

```js
const numbers = [1, 2, 3, 4, 5];
const sumTotal = numbers.reduce((accumulator, number) => accumulator + number, 0);
```

### All

```cs
const numbers = [1, 2, 3, 4, 5];
const areAllPositives = numbers.All(number => number > 0);
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const areAllPositives = numbers.every(number => number > 0);
```

### Any

```cs
const numbers = [1, 2, 3, 4, 5];
const haveAnyEven = numbers.Any(number => number % 2 == 0);
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const haveAnyEven = numbers.some(number => number % 2 === 0);
```

### Append

```cs
const numbers = [1, 2, 3, 4, 5];
numbers.Append(6);
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
numbers.push(6);
```

### Concat

```cs
const numbers = [1, 2, 3, 4, 5];
const tenNumbers = numbers.Concat(new int[] { 6, 7, 8, 9, 10 });
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const tenNumbers = numbers.concat([ 6, 7, 8, 9, 10 ]);
```

### Count

```cs
const numbers = [1, 2, 3, 4, 5];
const countOfEvenNumbers = numbers.Count(number => number % 2 == 0);
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const countOfEvenNumbers = numbers.filter(number => number % 2 === 0).length;
```

### FirstOrDefault

```cs
const numbers = [1, 2, 3, 4, 5];
const three = numbers.FirstOrDefault(number => number == 3);
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const three = numbers.find(number => number === 3);
```

### ForEach

```cs
const numbers = [1, 2, 3, 4, 5];
numbers.ForEach(number => number = number * 100);
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
numbers.forEach(number => number = number * 100);
```

### OrderBy

```cs
const numbers = [3, 1, 4, 1, 5, 9];
const orderedNumbers = numbers.OrderBy(number => number);
```

```js
const numbers = new int[] { 3, 1, 4, 1, 5, 9 };
const orderedNumbers = numbers.sort();
```

### Reverse

```cs
const numbers = [1, 2, 3, 4, 5];
const reversedNumbers = numbers.Reverse();
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const reversedNumbers = numbers.reverse();
```

### Select

```cs
const numbers = [1, 2, 3, 4, 5];
const entries = numbers.Select((number, index) => new { index, number });
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const entries = numbers.map((number, index) => ({ index, number }));
```

### Where

```cs
const numbers = [1, 2, 3, 4, 5];
const evenNumbers = numbers.Where(number => number % 2 == 0);
```

```js
const numbers = new int[] { 1, 2, 3, 4, 5 };
const evenNumbers = numbers.filter(number => number % 2 === 0);
```
