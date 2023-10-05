# Angular: Http

This module includes all the members required to handle http requests/responses

The first thing to do is setup the `HttpClientModule` in the `app.module.ts`

```ts
// app.module.ts

import { HttpClientModule } from '@angular/common/http';

@NgModule({
  imports: [
    // List of modules
    HttpClientModule
  ],
  declarations: [
    // List of components, directives and pipes
  ],
  bootstrap: [
    // List of bootstrap modules
  ]
})
export class AppModule {}
```

`PENDING`

- `map` function from `rxjs/operators`
- `catchError` function from `rxjs/operators`
- `throwError` function from `rxjs`