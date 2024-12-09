# Jasmine: Async

```ts
describe('Async tests', () => {
  beforeEach(async () => {
    await someLongSetupFunction();
  });

  it('Test awaitable function', async () => {
    const result = await someAsyncFunction();
    expect(result).toEqual(someExpectedValue);
  });
});
```

## Promises

```ts
describe('Testing with promises', () => {
  beforeEach(() => {
    return new Promise((resolve, reject) => {
      // ...
      resolve();
    });
  });

  it('Test function that return a promise', () => {
    return someAsyncFunction().then((result) => {
      expect(result).toEqual(someExpectedValue);
    });
  });
});
```

## Callbacks

```ts
describe('Testing with callback function', () => {
  beforeEach((done) => {
    setTimeout(() => {
      // do some stuff
      done();
    }, 100);
  });


  it('Testing callback function', (done) => {
    someAsyncFunction((result) => {
      expect(result).toEqual(someExpectedValue);
      done();
    });
  });
});
```
