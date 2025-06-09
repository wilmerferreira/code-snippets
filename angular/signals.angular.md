# Signals

In Angular, you use signals to create and manage state. A signal is a lightweight wrapper around a value.

> Signals are supported since Angular v16

## computed

Create a computed Signal which derives a reactive value from an expression.

```ts
import { computed } from '@angular/core'

@Component({
  // ...
})
export class AnyComponent {
  randomNumber = computed(() => {
    return `The random number is ${Math.random()}.`;
  });
}
```

## input

```ts
@Component({
  // ...
})
export class MyComponent {
  firstName = input<string>(); // Signal<string | undefined>
  lastName = input.required<string>(); // Signal<string> (as required)
  age = input(0); // Signal<number> (with default "0")
}
```
