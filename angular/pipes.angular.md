# Pipes

A template expression operator that takes in a value and returns a new value representation

```html
<!-- In this case we have two pipes: slice and uppercase -->
<h1>{{ item.name | slice: 0: 10 | uppercase }}</h1>
```

## Custom Pipes

```ts
// category-list.pipe.ts
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'categoryList',
  pure: true // true means stateless (this parameter is optional)
})
export class CategoryListPipe implements PipeTransform {
  transform(mediaItems) {
    // ...
  }
}
```

> Remember to add the custom pipe to the `app.module.ts`

## More Information

- [Pipes](https://angular.dev/guide/templates/pipes)
  - [Built-in pipes](https://angular.dev/guide/templates/pipes#built-in-pipes)
