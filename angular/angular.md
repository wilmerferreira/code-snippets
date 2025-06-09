# Angular

## Getting Started

- Install latest [node LTS](https://nodejs.org/en/download/)

- Install [Angular CLI](https://www.npmjs.com/package/@angular/cli) globally

  ```sh
  npm install -g @angular/cli
  ```

  - **Windows users must also run the following command**

    ```ps1
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
    ```

- Create a new angular app

  ```sh
  ng new my-app # Replace "my-app" with your application name
  ```

- Run the application

  ```sh
  cd my-app # Replace "my-app" with your application name
  ng serve --open # The --open command (or -o for short) opens the app in the browser
  ```

This template comes with [karma](https://karma-runner.github.io/) and [jasmine](https://jasmine.github.io/)

## Main Modules/Packages

- `@angular/platform-browser`
  - `BrowserModule`: Includes the basic directives such as `ngIf` and `ngFor`
- `@angular/core`
- `@angular/common`
- `@angular/common/http`
- `@angular/forms`
  - `FormsModule`: includes the `ngModel` and many other directives
- `@angular/router`
  - `FormsModule`: includes the router itself, `router-outlet` and many others

## Template Syntax

- Interpolation (`{{ ... }}`), the following statements aren't supported
  - Assignments
  - Newing up variables
  - Chaining expressions
  - Incrementing/decrementing
- Binding
  - Property binding (`[attribute-name]="value"` or `attribute-name="{{ property }}"`)
  - Event binding (`(eventname)="functionName($event)"`)
- Expressions
- Conditional templating
- Template variables
- Template expression operators

### Binding

- Using string interpolation

  ```html
  <!-- This creates a one-way binding to the src attribute using the path variable -->
  <img src="{{ path }}" />
  ```

- One way binding

  ```html
  <!-- This creates a one-way binding to the src attribute using the path variable -->
  <img [src]="path" />
  ```

- Two-way binding

  ```html
  <!-- This creates a two-way binding to the value attribute using the firstName variable -->
  <label>First Name</label>
  <input type="text" [(value)]="firstName" />
  ```

`PENDING`

## Events

Angular supports defining event listeners on an element in your template by specifying the event name inside parentheses along with a statement that runs every time the event occurs.

> It is a good practice to prefix the functions bound to events with `on`, e.g. `onClick()`

```ts
@Component({
  template: `
    <button (click)="onButtonClick()" />
  `,
  // ...
})
export class AppComponent {
  onButtonClick(): void {
    console.log('Button clicked!');
  }
}
```

## Directives

- Using the sugar syntax

  ```html
  <p *ngIf="yourProperty">Sample</p>
  ```

- Using the `ng-template` element

  ```html
  <ng-template [ng-if]="yourProperty">
    <p>Sample</p>
  </ng-template>
  ```

The main directives are:

- `ngIf`
- `ngFor`
- `ngSwitch`
- `ngClass`
- `ngStyle` (not recommended)

### Structural Directive

Structural directives using sugar syntax start with `*`

- `ngIf`: _If_ logic

  ```html
  <p *ngIf="yourProperty">Sample</p>
  ```

- `ngFor`: For loops, used to repeat markup

  ```html
  <my-component *ngFor="let item of list">
    <p>{{ item }}</p>
  </my-component>
  ```

### Attribute Directive

- `ngClass`

### Custom Directives

```ts
// HostBinding is used to bind a host element property to a directive property
import { Directive, HostBinding } from '@angular/core';

@Directive({
  selector: '[mwFavorite]'
})
export class FavoriteDirective {
  @HostBinding('class.is-favorite') isFavorite = true;
}
```

## Schematics

### Components

Component includes:

- Template
  - View layout
  - Created with `html`
  - Includes bindings and directives

- Class
  - Code supporting the view
  - Created with `TypeScript`
  - Properties: data
  - Methods: logic

- Metadata
  - Extra data for Angular
  - Defined with a decorator

> The custom elements CANNOT be self closing

```ts
// We must import the component from this library
import { Component } from '@angular/core';

// Component classes must use the Component decorator
@Component({
  selector: 'pm-root', // The selector should be kebab-case prefixed with the same prefix used when you created the app
  template: `<div>
    <h1>{{ pageTitle }}</h1>
    <div>My First Components</div>
  </div>` // This can either be here or we can point to a html file (using the templateUrl field instead)
})
export class AppComponent { // Note that this class is exported and it has a "Component" suffix
  pageTitle: string = 'Acme Product Management'; // Members should use camelCase
}
```

### Decorator

- `@` decorator's indicator
- `Component` decorator's name
- `()` arguments

```ts
@Component() // In this case the decorator name is called "Component"
```

Common Decorators:

- `Component`
- `Input`: used to allow property binding in components
- `Output`: used to allow property binding in components, used in event binding
- `NgModule`

## Main assets

### app.module.ts

This will include 4 primary sections:

- `declarations`: list of **components**, **directives** and **pipes** used in the app.
- `imports`: list of other **modules** used in the app.
- `providers`: list of **services** used in the app.
- `bootstrap`: main **component** used to bootstrap the app.

```ts
// This can be the module name or the path
import { NgModule } from '@angular/core';

// This contains the core modules (Components, Directives & Pipes) that allows work with the DOM
import { BrowserModule } from '@angular/platform-browser';

// Relative path to the file (the file's extension is not needed)
import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
    // Components, directives and pipes
  ],
  imports: [
    BrowserModule
    // Other modules used in the app
  ],
  providers: [
    // Services used in the app
  ],
  bootstrap: [
    // Root/starting component(s) for the bootstrap (entry point of the app code)
    AppComponent
  ]
})
export class AppModule { }
```

### app.component.ts

Main/root app component

- Example using `template` and `styles`

  ```ts
  import { Component } from '@angular/core';
  
  // This decorator needs at least two metadata properties/arguments (selector and template)
  @Component({
    selector: 'app-root'
    // This will be rendered within the selector's element
    template: '<h1>My App</h1>',
    styles: [
      'h1 { color: #dddddd; }'          
    ]
  })
  export class AppComponent {}
  ```

- Example using `templateUrl` and `styleUrls`

  ```ts
  import { Component } from '@angular/core';
  
  // This decorator needs at least two metadata properties/arguments (selector and template url)
  @Component({
    selector: 'app-root'
    templateUrl: './app.component.html',
    styleUrls: [ './app.component.css' ]
  })
  export class AppComponent {}
  ```

### main.ts

This file will hold the bootstrap's logic, angular is configured to work is different platforms

```ts
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app/app.module';

platformBrowserDynamic().bootstrapModule(AppModule);
```

## Best Practices

- Follow the _LIFT_ practices.
  - Locate code quickly
  - Identify code at a glace
  - Flattest structure possible
  - Try to be _DRY_ (Don't repeat yourself)
- Keep the local `imports` separated from the official imports
- Use `templateUrl` instead of inline `template`
- Use `styleUrls` instead of inline `style`
- Prefix `components` in order to avoid clashes
- Name `components` (element name and files) using `kebab-case` (lowercase and dashes between words)
  - Use the following convention for the component's assets (`<descriptor>.<type>.<filetype>`)
    - `your-component-name.component.html`
    - `your-component-name.component.ts`
    - `your-component-name.component.spec.ts`
    - `your-component-name.component.css`
- Prefix the assets with your _app name_ or _feature name_, recommendation from the [Angular CLI](http://angular.io)
- Define `private` `functions` after the `public` ones in classes

## Questions

- `Observable` vs `Promises` vs `async`/`await`
- Structure big angular projects
- Reuse angular components in other projects
- Minify assets
- Unit tests
- Where is configured the TypeScript version
- Use angular with bootstrap 4+
- Run tests in multiple browsers
- CI/CD
- Firebase (deployment)
- Dockerize

## More Information

- [Angular.io](https://angular.io/)
  - [Cheat Sheet](https://angular.io/guide/cheatsheet)
  - [Lifecycle hooks](https://angular.io/guide/lifecycle-hooks)
  - [Update Guide](https://update.angular.io/)
- [RxJS](https://rxjs.dev/)
- [angular/angular - GitHub](https://github.com/angular/angular)
- [Become an Angular Developer - LinkedIn Learning](https://www.linkedin.com/learning/paths/become-an-angular-developer-2)
  - [Learning Angular - LinkedIn Learning](https://www.linkedin.com/learning/learning-angular/)
    - [planetoftheweb/learnangular - GitHub](https://github.com/planetoftheweb/learnangular)
      - [03_04e branch (**completed**)](https://github.com/planetoftheweb/learnangular/tree/03_04e)
  - [Angular Essential Training - LinkedIn Learning](https://www.linkedin.com/learning/angular-essential-training-2)
    - [coursefiles/angular-essential-training - GitHub](https://github.com/coursefiles/angular-essential-training)
      - [**completed** branch](https://github.com/coursefiles/angular-essential-training/tree/completed)
- [Advance Your Angular Skills - LinkedIn Learning](https://www.linkedin.com/learning/paths/advance-your-angular-skills)
- [Angular: Testing and Debugging](https://www.linkedin.com/learning/angular-testing-and-debugging-10201318/)
  - [LinkedInLearning/Angular-2875342 - GitHub](https://github.com/LinkedInLearning/Angular-2875342)
- [Semantic UI](https://semantic-ui.com/)
