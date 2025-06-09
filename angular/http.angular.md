# Angular: Http

This module includes all the members required to handle http requests/responses

## HttpClient

This class is responsible to perform http operations.

### Modern usage

1. Add the `provideHttpClient` in the `main.ts`

   ```ts
   // main.ts
   
   import { bootstrapApplication } from '@angular/platform-browser';
   import { provideHttpClient } from '@angular/common/http';
   
   import { AppComponent } from './app/app.component';
   
   bootstrapApplication(AppComponent, { providers: [provideHttpClient()] })
     .catch((err) => console.error(err));
   ```

2. Inject client in the desired class (e.g. `Component`, `Service`, etc.)

   ```ts
   import { Injectable, inject } from '@angular/core';
   import { HttpClient } from '@angular/common/http';
   
   @Injectable({
     providedIn: 'root',
   })
   export class YourService {
     private httpClient = inject(HttpClient);

     // ...
   }
   ```

### Usage with modules

1. Configure the `HttpClientModule` in the `app.module.ts`

   ```ts
   // app.module.ts
   
   import { HttpClientModule } from '@angular/common/http';
   
   @NgModule({
     imports: [
       // ...
       HttpClientModule
     ],
     // ...
   })
   export class AppModule {}
   ```

2. Inject client in the desired class (e.g. `Component`, `Service`, etc.)

   ```ts
   import { Injectable } from '@angular/core';
   import { HttpClient } from '@angular/common/http';
   
   @Injectable({
     providedIn: 'root',
   })
   export class YourService {
      constructor (private httpClient: HttpClient) {}
     
      // ...
   }
   ```

## Interceptors

Interceptors are middleware that allows common patterns around retrying, caching, logging, and authentication to be abstracted away from individual requests.

### Latest usage

1. Define an interceptor function

   ```ts
   // logging.interceptor.ts

   export function loggingInterceptor(req: HttpRequest<unknown>, next: HttpHandlerFn): Observable<HttpEvent<unknown>> {
     console.log(req.url);
     return next(req);
   }
   ```

2. Configure interceptor in the `main.ts` file

   ```ts
   // main.ts
   
   import { bootstrapApplication } from '@angular/platform-browser';
   import { provideHttpClient } from '@angular/common/http';
   
   import { AppComponent } from './app/app.component';
   import { loggingInterceptor } from './logging.interceptor';
   
   bootstrapApplication(AppComponent, {
     providers: [provideHttpClient(withInterceptors([loggingInterceptor, cachingInterceptor]))]
   }).catch((err) => console.error(err));
   ```

`PENDING`

- `map` function from `rxjs/operators`
- `catchError` function from `rxjs/operators`
- `throwError` function from `rxjs`
