# Jest

## Setup

- Create a folder
- Run `npm init -y`
- Run `npm install jest --save-dev`
- Open the `package.json` and change the value of the `scripts.test` attribute to just `jest`
- Add ECMAScript support (optional)
  - Add babel `npm install --save-dev babel-jest @babel/core @babel/preset-env`
  - Create an file called `babel.config.js`

    ```js
    module.exports = {
      presets: [['@babel/preset-env', {targets: {node: 'current'}}]],
    };
    ```

- Add intellisense support: `npm install @types/jest --save-dev`

## Investigate

- How to debug jest tests in visual studio

## More Information

- [jestjs.io](https://jestjs.io/)
