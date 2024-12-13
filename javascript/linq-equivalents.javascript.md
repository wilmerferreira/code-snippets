# Javascript: Linq Equivalents for JavaScript Arrays

| Linq              | Javascript            |
|-------------------|-----------------------|
| `Aggregate`       | `reduce`              |
| `All`             | `every`               |
| `Any`             | `some`                |
| `Append`          | `push`                |
| `Concact`         | `concact`             |
| `FirstOrDefault`  | `find` or `includes`  |
| `ForEach`         | `forEach`             |
| `OrderBy`         | `sort`                |
| `Reverse`         | `reverse`             |
| `Select`          | `map`                 |
| `Where`           | `filter`              |

## Aggregate

```cs
var listOfNumbers = new int[] { 1, 2, 3, 4, 5 };
var sumTotal = listOfNumbers.Aggregate(0, (total, currentItem) => total + currentItem);
```

```js
const listOfNumbers = [1, 2, 3, 4, 5];
const sumTotal = listOfNumbers.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
```

## All

```cs
const listOfNumbers = [1, 2, 3, 4, 5];
const areAllPositives = listOfNumbers.every(i => i > 0);
```

```js
var listOfNumbers = new int[] { 1, 2, 3, 4, 5 };
var areAllPositives = listOfNumbers.All(i => i > 0);
```
