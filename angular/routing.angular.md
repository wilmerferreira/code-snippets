# Angular: Routing

## Configuration

1. Define your routes in the `app.routing.ts`

   ```ts
   // app.routing.ts
   import { Routes, RouterModule } from '@angular/router';
   import { MediaItemFormComponent } from './media-item-form.component';
   import { MediaItemListComponent } from './media-item-list.component';
   import { NotFoundComponent } from './not-found.component';
   
   // The order of the items in this array matters (the first match wins!)
   const appRoutes : Routes = [
     { path: 'add', component: MediaItemFormComponent },
     { path: ':medium', component: MediaItemListComponent }, // The ":" character indicates a parameter (in this case called "medium")
     { path: '', pathMatch: 'full', redirectTo: 'all' },

     // This is the wildcard route, this will be called if the other routes does not match
     { path: '**', pathMatch: 'full', component: NotFoundComponent }
   ];

   export const routing = RouterModule.forRoot(appRoutes);
   ```

2. Import the `routing` class in the `app.module.ts`

   ```ts
   // app.module.ts
   
   import { routing } from './app.routing';
   
   @NgModule({
     imports: [
       // List of modules
       routing
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

3. Set the base url in the app html

   ```html
   <!-- index.html (within the /src folder) -->
   <html>
     <head>
       <base href="/">
     </head>
   </html>
   ```

4. Place the `router-outlet` element to your root page

## Router Outlets

This is a structural directive used as a placeholder for components using routing

```html
<router-outlet></router-outlet>
```

## Router Links

```html
<!-- This is the shorter version of a routerLink -->
<a routerLink="/"></a>

<!-- This is another way to define routerLinks, this is specific helpful when the route needs arguments -->
<a [routerLink]="['/']"></a>
<a [routerLink]="['/products', 123]"></a>
```

## Router Navigation

```ts
import { Router } from '@angular/router';

// ...
    constructor(private router: Router) {
      // ...
    }

    onClick(): void {
      this.router.navigate(['/products']);
    }
// ...
```

## Route Parameters

Once the route is defined in the apps module we can handle the parameter of a given route by having a parameter in the constructor for the activated route

```ts
import { ActivatedRoute } from '@angular/router';

// ...
    constructor(private route: ActivatedRoute) {
      // ...
    }
// ...
```

There are two ways to read the parameter:

- Snapshot: Read the parameter one time

  ```ts
  this.route.snapshot.paramMap.get('id');
  ```

- Observable: Read emitted parameters as they change

  ```ts
  this.route.paramMap.subscribe(
    params => console.log(params.get('id'))
  );
  ```

## Lazy Loading Routes

This option allows to lazy load routes from a different module.

In this case the routes needs to be configured in the root/main routing list

```ts
// app.routing.ts

import { Routes, RouterModule } from '@angular/router';

const appRoutes: Routes = [
  { path: 'add', loadChildren: () => import('./another-feature/another-feature.module').then(m => m.AnotherFeatureModule) }
];
```

## Route Guards

These are the types of guards:

- `CanActivate`
- `CanDeactivate`
- `Resolve`
- `CanLoad`

Steps to configure a guard

1. Create a guard class

   ```ts
   import { Injectable } from '@angular/core';
   import { CanActivate } from '@angular/router';
   
   @Injectable({ providedIn: 'root' })
   export class ProductDetailGuard implements CanActivate {
     canActivate(): boolean { /* ... */  }
   }
   ```

2. Configure the guard in the router config

   ```ts
   // app.module.ts
   
   import { RouterModule } from '@angular/router';
   import { ProductDetailGuard } from './product-detail.guard';
   import { ProductDetailComponent } from './product-detail.component';
   // ...
   
   @NgModule({
     imports: [
       // ...
       RouterModule.forRoot([
        { path: 'products/:id', canActivate: [ ProductDetailGuard ], component: ProductDetailComponent }
        // ...
       ])
     ],
     declarations: [ /* ... */ ],
     bootstrap: [ /* ... */ ]
   })
   export class AppModule {}
   ```
