# R

- R is **case sensitive**
- Variable assignment `my_var <- "value`
- Data types
  - Numerics (decimals)
  - Integers
  - Logical (Boolean)
  - Characters (String)
- Vectors `c(FALSE, 1, "two")`

## Vectors

In `R` the vectors are NOT zero-based. eg. the `my_array[1]` returns the first element.

- Assign names to a vector

```r
roulette_vector <- c(-24, -50, 100, -350, 10)
names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
```

- Sum vectors items

```r
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)
total_vector <- sum(A_vector) + sum(B_vector)
```

- Sum vectors item by item

```r
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)
total_vector <- A_vector + B_vector
```

```r
# This gets specific elements, in this case the elements 2, 3 and 4
poker_vector[c(2, 3, 4)]
```

```r
# This gets elements by range
roulette_vector[2:5]
```

```r
# The mean function returns the average
mean(roulette_vector[2:5])
```

## Logical operators

| Operator  | Description                   |
|-----------|-------------------------------|
| <         | for less than                 |
| >         | for greater than              |
| <=        | for less than or equal to     |
| >=        | for greater than or equal to  |
| ==        | for equal to each other       |
| !=        | not equal to each other       |
