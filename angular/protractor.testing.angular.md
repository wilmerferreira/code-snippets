# Angular: Protractor (Testing)

It is the official end-to-end framework, it was made by the angular team and it's included by default in angular applications

```sh
npm run e2e
```

> ng e2e

The protractor configuration file is located at `/e2e/protractor.conf.js` and it also has its own `/e2e/tsconfig.ts` which extends the app one

## End-to-end Testing

The main dependencies are:

- from `protractor`
  - `browser`: used to interact with the browser (e.g. navigation)
    - `get()`: navigates to a absolute/relative url
  - `element()`: helps to find an element in the page
    - `all()`: helps to find multiple elements in the page
  - `by`: helps to find elements using css selectors
    - `css()`: gets elements by selector

## More Information

- [Protractor](https://protractor.angular.io/)
  - [Protractor: end-to-end test framework for Angular](http://www.protractortest.org/)
