# Angular: Testing

[Jasmine](../jasmine/jasmine.md) is one of the testing frameworks used to test angular applications.

In order to test components Angular use some of these classes:

- from `@angular/core/testing`
  - `TestBed`
  - `ComponentFixture`

## Testing Services

```ts
import { TestBed } from '@angular/core/testing';
import { HttpClient } from '@angular/common/http';

import { WebStorageService } from './web-storage.service';

describe('WebStorageService', () => {
  let service: WebStorageService;

  beforeEach(async () => {
    TestBed.configureTestingModule({
      providers: [
        { provide: HttpClient, useValue: jasmine.createSpyObj('HttpClient', [ 'get', 'put' ]) }
      ]
    })
    service = TestBed.inject(WebStorageService);
  })

  // Angular is async by design, but jasmine is not, so we need to tell jasmine when all the asyc work is done, the simplest way to handle this is by adding the DoneFn as as argument
  it('Should return a User list with 16 elements', (done: DoneFn) => {
    service.getAll().then((response) => {
      expect(response.length).toBe(16);
      done();
    });
  })
})
```

## Testing Pipes

```ts
import { HighlightTextPipe } from './highlight-text.pipe';

describe('HighlightTextPipe', () => {
  // We can declare this as a constant because pipes are stateless
  const pipe = new HighlightTextPipe();

  it('Create an instance', () => {
    expect(pipe).toBeTruthy();
  })
})
```

## Testing Components

```ts
import { TestBed, ComponentFixture } from '@angular/core/testing';

import { AppComponent } from './app.component';

describe('App Component', () => {
  let component: AppComponent;
  let fixture: ComponentFixture<AppComponent>;

  beforeEach(async () => {
    // This configures the test module (similar to the NgModule)
    await TestBed.configureTestingModule({
      declarations: [ AppComponent ]
    })
    .compileComponents(); // This returns a Promise

    // This needs to be done after the TestBed configuration
    fixture = TestBed.createComponent(AppComponent);
    component = fixture.componentInstance;
    
    // This triggers the change detection cycle in the component
    fixture.detectChanges();
  })

  it('Should have a title', () => {
    const compiled = fixture.nativeElement;
    const title = compiled.querySelector('h2').textContent;

    expect(title).toBe('Active Users');
  })
})
```

## Karma

Karma is the default test runner included in Angular.

The main files are:

- `/karma.config.js`: this is the karma configuration file
- `/app/test.ts`: this file is required by karma to load all the `spec` and framework files

The tests can be executed using

```sh
npm run test
```

> This is the equivalent to run `ng test`

## More Information

- [Jasmine Behavior-Driven JavaScript](https://jasmine.github.io/)
- [Jasmine Cheat Sheet](https://devhints.io/jasmine)
- [Karma](http://karma-runner.github.io/)
- [Testing Angular Applications - GitHub](https://github.com/testing-angular-applications/testing-angular-applications/)
