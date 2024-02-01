# Angular: Services & Dependency Injection

## Declaration / Configuration

Services needs to be added in the `providers` array property within the `app.module.ts`

```ts
// app.module.ts

import { MyCustomService } from './my-custom.service';

@NgModule({
  imports: [
    // List of modules
  ],
  declarations: [
    // List of components, directives and pipes
  ],
  bootstrap: [
    // List of bootstrap modules
  ],
  providers: [
    MyCustomService
  ]
})
export class AppModule {}
```

```ts
// my-custom.service.ts

export class MyCustomService {}
```

However, if the service needs to be injected to the root provider, this approach does not need to change the `app.module.ts`, in this case your service should be declared with the `Injectable` decorator from the `@angular/core` module

> This approach is more efficient since if the service is not actually used/referenced anywhere else in the code the compiler will ignore it

```ts
// my-custom.service.ts

import { Injectable } from '@angular/core';

@Injectable({
  providerIn: 'root'
})
export class MyCustomService {}
```

## Usage

```ts
// my-custom.component.ts

import { Component } from '@angular/core';
import { MyCustomService } from './my-custom.service';

@Component({
  selector: 'my-custom-element',
  templateUrl: 'my-custom.component.html',
  styleUrls: [ 'my-custom.component.css' ]
})
export class MyCustomComponent {
    constructor(private myCustomService: MyCustomService) {}
}
```

## Injection Token

- First Option: creating the providers with magic strings

  1. Setup the provider in the `app.module.ts`

     ```ts
     // app.module.ts
     
     const lookupLists = {
       mediums: [ 'Movies', 'Series' ]
     };
     
     @NgModule({
       imports: [
         // List of modules
       ],
       declarations: [
         // List of components, directives and pipes
       ],
       bootstrap: [
         // List of bootstrap modules
       ],
       providers: [
         { provide: 'lookupListToken', useValue: lookupLists }
       ]
     })
     export class AppModule {}
     ```

  2. Inject the provider in the component

     ```ts
     // my-custom.component.ts
     
     import { Component, Inject } from '@angular/core';
     import { MyCustomService } from './my-custom.service';
     
     @Component({
       selector: 'my-custom-element',
       templateUrl: 'my-custom.component.html',
       styleUrls: [ 'my-custom.component.css' ]
     })
     export class MyCustomComponent {
       constructor(
         private myCustomService: MyCustomService
         @Inject('lookupListToken') public lookupLists) {}
     }
     ```

  3. Bind the provider to the html

     ```html
     <ul>
       <li *ngFor="let medium of lookupLists.mediums">{{ medium }}</li>
     </ul>
     ```

- Second option: 

  1. Create a new file for the provider configuring the `InjectionToken`

     ```ts
     // providers.ts
     import { InjectionToken } from '@angular/core';

     // This name should be unique in the application
     export const lookupListToken = new InjectionToken('lookupListToken');

     export const lookupLists = {
       mediums: [ 'Movies', 'Series' ]
     };
     ```

  2. Setup the provider in the `app.module.ts`

     ```ts
     // app.module.ts
     import { lookupListToken, lookupLists } from './providers';
     
     @NgModule({
       imports: [
         // List of modules
       ],
       declarations: [
         // List of components, directives and pipes
       ],
       bootstrap: [
         // List of bootstrap modules
       ],
       providers: [
         { provide: lookupListToken, useValue: lookupLists }
       ]
     })
     export class AppModule {}
     ```

  3. Inject the provider in the component

     ```ts
     // my-custom.component.ts
     
     import { Component, Inject } from '@angular/core';
     import { MyCustomService } from './my-custom.service';
     import { lookupListToken } from './providers';
     
     @Component({
       selector: 'my-custom-element',
       templateUrl: 'my-custom.component.html',
       styleUrls: [ 'my-custom.component.css' ]
     })
     export class MyCustomComponent {
       constructor(
         private myCustomService: MyCustomService
         @Inject(lookupListToken) public lookupLists) {}
     }
     ```
