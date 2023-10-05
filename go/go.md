# Go Lang

[Language Documentation](https://golang.org/doc/)

1. It's a compiled language
1. it's a great language for systems programming (API's, Game engines, Network Applications, CLI apps)
1. It's required a **main** function as a entry point.

## Basic GO program

```go
package main

// fmt means format
import "fmt"

func main() {
  fmt.Println("Hello World")
}
```

## Command line commands

Build a go program
> go build

To run a go program
> go run main.go

To format a go file
> gofmt -w main.go

To import the dependant packages
> goimports -w main.go

Pass arguments to a go program
> go run main.go "My argument value"

## DataTypes

| DataType  | Initial value |
|-----------|---------------|
| byte      | 0             |
| int       | 0             |
| float     | 0.0           |
| string    | ""            |
| bool      | false         |
| function  | nil           |
| []string  |               |

## Operators

| Operators     | Description           | Example                   |
|---------------|-----------------------|---------------------------|
| ```:=```      | Type inference        | ```value := "My value"``` |
| ```var```     | Variable declaration  | ```var value string```    |

## Functions

```go
package main

import (
  "fmt",
  "time"
)

func main() {
  hourOfDay := time.Now().Hour()
  greeting := getGreeting()
}

func getGreeting(hour int) string {
  if hour < 12 {
    return "Good morning"
  } else if hour < 18 {
    return "Good afternoon"
  } else {
    return "Good evening"
  }
}
```

## Functions with errors

```go

package main

import (
  "fmt",
  "time",
  "errors",
  "os"
)

func main() {
  hourOfDay := time.Now().Hour()
  greeting, err := getGreeting()

  if err != nil {
    fmt.Println(err)
    os.Exit(1)
  }

  fmt.Println(greeting)
}

func getGreeting(hour int) (string, error) {
  var message string

  if hour < 7 {
    err := errors.New("Too early for greetings!")
    message = "Good morning", err
  } else if hour < 12 {
    message = "Good morning"
  } else if hour < 18 {
    message = "Good afternoon"
  } else {
    message = "Good evening"
  }

  return message, nil
}
```

## Arrays and slices

### Arrays

```go

package main

import "fmt"

func main() {
  var langs [3]string

  langs[0] = "Go"
  langs[1] = "Ruby"
  langs[2] = "Javascript"

  fmt.Println(langs)
}

```

### Slices

```go

package main

import "fmt"

func main() {
  var langs []string

  langs = append(langs, "Go")
  langs = append(langs, "Ruby")
  langs = append(langs, "Javascript")
  langs = append(langs, "LOLcode")

  fmt.Println(langs)
}

```

### Slices literals and for/range

```go

package main

import "fmt"

func main() {
  langs := []string { "Go", "Ruby", "Javascript" }

  for i := range langs {
    fmt.Println(i) // this will print the index
  }
  
  // we need to set "_" to the first variable otherwise
  // the compilar will throw an error because the variable is not used
  for _, element := range langs {
    fmt.Println(element)
  }
}

```

## Structures

```go

package main

import "fmt"

type gopher struct {
  name string
  age int
}

func main() {
  gopher1 := gopher { name: "Phil", age: 30 }
  gopher2 := gopher { name: "Noodles", age: 90 }
}

```

### Structs methods

```go

package main

import "fmt"

type gopher struct {
  name string
  age int
}

func (g gopher) jump() string {
  if g.age < 65 {
    return g.name + " can jump HIGH"
  }

  return g.name + " can still jump"
}

func main() {
  gopher1 := gopher { name: "Phil", age: 30 }
  gopher2 := gopher { name: "Noodles", age: 90 }

  fmt.Println(gopher1.jump())
  fmt.Println(gopher2.jump())
}

```

### Pass parameters by references "&" and "*"

```go
```

## Interfaces

```go

//...

type jumper interface {
  jump() string
}

func getList() []jumper {
  phil := &gopher { name: "Phil", age: 30 }
  noodles := &gopher { name: "Noodles", age: 90 }
  barbaro := &horse { name: "Barbaro", weight: 2000 }

  list := []jumper { phil, noodles, barbaro }

  return list
}

func main () {
  jumperList := getList()

  for _, jumper := range jumperList {
    fmt.Println(jumper.jump())
  }
}

//...

```
