# Angular: Forms

- Bind Data
- Bind Events
- Forms
  - In/Out
  - Change Tracking
  - Validation

- Template-driven Forms
  - Simple
  - Ease of use
- Model-driven Forms
  - Full powered

## Template-driven Forms

> It needs to add the `FormsModule` in the `imports` property within the `app.module.ts`, this module can be imported from `@angular/forms`

- Add the function to handle the form submission (`onSubmit` in this case) with an argument for the form values (`mediaItem` in this case)

```ts
import { Component } from '@angular/core';

@Component({
  selector: 'mw-media-item-form',
  templateUrl: './media-item-form.component.html',
  styleUrls: ['./media-item-form.component.css']
})
export class MediaItemFormComponent {
  onSubmit(mediaItem) {
    console.log(mediaItem);
  }
}
```

- You will need to create a new template reference variable (`#mediaItemForm`)
- Add the `ngModel` directive to all the html fields needed to bind data
- Bind the `ngSubmit` event to a function (in this case `onSubmit`)
  - Pass the value of the form (`mediaItemForm.value`)

```html
<header>
  <h2>Add Media to Watch</h2>
</header>
<form
  #mediaItemForm="ngForm"
  (ngSubmit)="onSubmit(mediaItemForm.value)">
  <ul>
    <li>
      <label for="medium">Medium</label>
      <select name="medium" id="medium" ngModel>
        <option value="Movies">Movies</option>
        <option value="Series">Series</option>
      </select>
    </li>
    <li>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" ngModel>
    </li>
    <li>
      <label for="category">Category</label>
      <select name="category" id="category" ngModel>
        <option value="Action">Action</option>
        <option value="Science Fiction">Science Fiction</option>
        <option value="Comedy">Comedy</option>
        <option value="Drama">Drama</option>
        <option value="Horror">Horror</option>
        <option value="Romance">Romance</option>
      </select>
    </li>
    <li>
      <label for="year">Year</label>
      <input type="text" name="year" id="year" maxlength="4" ngModel>
    </li>
  </ul>
  <button type="submit">Save</button>
</form>
```

## Reactive Forms

> It needs to add the `ReactiveFormsModule` in the `imports` property within the `app.module.ts`, this module can be imported from `@angular/forms`

- Import the `OnInit` class from `@angular/core`
- Import the `FormGroup` and `FormControl` decorators from `@angular/forms`
- Create a variable for the `FormGroup`
- Implement the `ngOnInit` function and initialize the `FormGroup` variable, setting the default values for each of the properties
- Add the function to handle the form submission (`onSubmit` in this case) with an argument for the form values (`mediaItem` in this case)

Here's an example of a login component using reactive forms

- Markup

  ```html
  <!-- 👇 "formGroup" is required when using "formControlName" -->
  <form [formGroup]="loginForm" (ngSubmit)="onSubmit()">
    <div>
      <label for="email">Email</label>
      <input type="email" id="email" [formControl]="loginForm.controls.email" /> <!-- Use "formControl" for binding -->
    </div>
    <div>
      <label for="password">Password</label>
      <input type="password" id="password" formControlName="password" /> <!-- Alternatively use "formControlName" -->
    </div>
    <button type="submit">Login</button>
  </form>
  ```

- Typescript

  ```ts
  import { Component } from '@angular/core';
  import { ReactiveFormsModule, FormGroup, FormControl, Validators } from '@angular/forms';
  
  @Component({
    selector: 'app-login',
    standalone: true,
    imports: [ReactiveFormsModule],
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.css']
  })
  export class LoginComponent {
    loginForm: new FormGroup({
      // 👇 The first argument is the initial value
      email: new FormControl('', {
        validators: [ Validators.email, Validators.required ]
      }),
      password: new FormControl('', {
        validators: [ Validators.required, Validators.minLength(6) ]
      })
    });

    onSubmit() {
      console.dir(loginForm);

      const enteredEmail = this.loginForm.email;
      const enteredPassword = this.loginForm.password;

      console.log({ enteredEmail, enteredPassword });
    }
  }
  ```

This is another example using reactive forms:

```ts
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';

@Component({
  selector: 'mw-media-item-form',
  templateUrl: './media-item-form.component.html',
  styleUrls: ['./media-item-form.component.css']
})
export class MediaItemFormComponent implements OnInit {
  form: FormGroup;

  ngOnInit() {
    this.form = new FormGroup({
      medium: new FormControl('Movies'),
      name: new FormControl(''),
      category: new FormControl(''),
      year: new FormControl(''),
    });
  }

  onSubmit(mediaItem) {
    console.log(mediaItem);
  }
}
```

- Bind the `FormGroup` (`[formGroup]="form"`)
- Add the `formControl` directive with their correspondent name to all the html fields needed to bind data (e.g. `formControl="year"`)
- Bind the `ngSubmit` event to a function (in this case `onSubmit`)
  - Pass the value of the form (`form.value`)

```html
<header>
  <h2>Add Media to Watch</h2>
</header>
<form
  [formGroup]="form"
  (ngSubmit)="onSubmit(form.value)">
  <ul>
    <li>
      <label for="medium">Medium</label>
      <select name="medium" id="medium" formControlName="medium">
        <option value="Movies">Movies</option>
        <option value="Series">Series</option>
      </select>
    </li>
    <li>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" formControlName="name">
    </li>
    <li>
      <label for="category">Category</label>
      <select name="category" id="category" formControlName="category">
        <option value="Action">Action</option>
        <option value="Science Fiction">Science Fiction</option>
        <option value="Comedy">Comedy</option>
        <option value="Drama">Drama</option>
        <option value="Horror">Horror</option>
        <option value="Romance">Romance</option>
      </select>
    </li>
    <li>
      <label for="year">Year</label>
      <input type="text" name="year" id="year" maxlength="4" formControlName="year">
    </li>
  </ul>
  <button type="submit">Save</button>
</form>
```

## Validation

CSS Classes for Validation:

- `ng-untouched` and `ng-touched`
- `ng-pristine` and `ng-dirty`
- `ng-valid` and `ng-invalid`

### Model-driven Validation

Add the validations to the `FormGroup`s when they are initialized in the `ngOnInit` function.

- Single validation

  ```ts
  new FormControl('', Validators.pattern('[\\w\\-\\s\\/]+'));
  ```

- Multiple validations

  ```ts
  new FormControl('', Validators.compose([
    Validators.required,
    Validators.pattern('[\\w\\-\\s\\/]+')
  ]));
  ```

It is handy to bind the `disabled` attribute to the submit button since angular by default won't _block_ the form submission

```html
<button type="submit" [disabled]="!form.valid">Save</button>
```

### Built-In Validators

- `RequiredValidator`
- `PatternValidator`
- `MinLengthValidator`
- `MaxLengthValidator`
- `MinValidator`
- `MaxValidator`
- `EmailValidator`
- `CheckboxRequiredValidator`

### Custom Validators

1. Create a function to validate the input data

   ```ts
   yearValidator(control: FormControl) {
     if (control.value.trim().length === 0) {
       return null;
     }
     const year = parseInt(control.value, 10);
     const minYear = 1900;
     const maxYear = 2100;
     if (year >= minYear && year <= maxYear) {
       return null;
     } else {
       return { year: true };
     }
   }
   ```

2. Add the function's reference in the `FormControl` instantiation

   ```ts
   new FormControl('', this.yearValidator)
   ```

The function can also return an `object` instead a `boolean`, this will be handy if we want to send back some information around the validation logic

```ts
yearValidator(control: FormControl) {
  if (control.value.trim().length === 0) {
    return null;
  }
  const year = parseInt(control.value, 10);
  const minYear = 1900;
  const maxYear = 2100;
  if (year >= minYear && year <= maxYear) {
    return null;
  } else {
    return {
      year: {
        min: minYear,
        max: maxYear,
      }
    };
  }
}
```

Then in the html we can create a template variable to store and display these values

```html
<div *ngIf="form.get('year').errors as yearErrors">
  Must be between {{ yearErrors.year.min }} and {{ yearErrors.year.max }}
</div>
```

### Async Validators

> TBC

### Form Object Representation

> TBC

## Investigate

- `ngNativeValidate`
