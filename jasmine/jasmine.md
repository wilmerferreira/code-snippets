# Jasmine

Jasmine is a behavior-driven development framework for testing JavaScript code. It provides a clean and easy-to-read syntax for writing tests, making it simple to verify the correctness of your code. Jasmine does not depend on any other JavaScript frameworks and does not require a DOM.

## Simple Tests

Here's a simple snippet for a test class.

```js
describe('My tests', () => {
  it('My first test', () => {
    expect(true).toBe(true);
  });
  
  it('2 + 2 equals 4', () => {
    expect(2 + 2).toBe(4);
  });
});
```

Here's a simple example of a unit test for a simple class:

```ts
import Contact from `./contact`;

describe('Tests on a simple class', () => {
  let contact: Contact = null;

  beforeEach(() => {
    contact = new Contact();
  });

  it('Should have a valid constructor', () => {
    expect(contact).not.toBeNull();
  });
});
```

## Main elements

- Suites: `describe()`, optional function to group tests.
- Specs (Tests): `it()`.
- Matchers: `expect()`, responsible of test assertions.
- Setup: `beforeEach()` and `beforeAll()`.
- Teardown: `afterEach()` and `afterAll()`.
- Disable: `xdescribe()` and `xit()`.

> TODO: Add snippets for test with failures

## More Information

- [Jasmine Docs](https://jasmine.github.io/pages/docs_home.html)
- [Jasmine Repository - GitHub](https://github.com/jasmine/jasmine)
- [Jasmine Cheat Sheet](https://devhints.io/jasmine)
- [Testing Angular Applications - GitHub](https://github.com/testing-angular-applications/testing-angular-applications)
