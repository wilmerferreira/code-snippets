# React

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
  <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
  <script src="https://unpkg.com/babel-standalone@6/babel-min.js"></script>
  <title>React Playground</title>
</head>
<body>
  <div id="root"></div>

  <script type="text/babel">
    ReactDOM.render(
      <ul>
        <li>🤖</li>
        <li>🤠</li>
        <li>🌝</li>
      </ul>,
      document.getElementById("root")
    );
  </script>
</body>
</html>
```

## Getting Started

1. Install the latest LTS version of node
2. Create a sample react app

   > `npx` is the node package runner

   ```sh
   # This will create a new folder with the minimum assets for a simple react app
   npx create-react-app my-react-app

   cd my-react-app
   ```

   - Install the `react-icons`(optional)

     ```sh
     npm install react-icons --save
     ```

   - Import Icon (optional)

   ```js
   import { ICONNAME } from "react-icons/bs"
   
   // ...

   <ICONNAME />
   <ICONNAME></ICONNAME>
   ```

3. Run `npm`

   ```sh
   # This will start a process on port 3000
   npm start
   ```

This default installation come with some modules pre-installed:

- Webpack: JavaScript bundler
- Babel: JavaScript transpiler
- ES Lint (extension)
- Jest: Testing framework
- Web Vitals: Performance monitoring tool, also checks accessibility and good practices

## Basics

- `react`
  - `ReactDOM.render()`
  - `createElement()`
  - `useState()`
  - `useEffect()`
  - `useReducer()`
  - `useRef()`

- `react-dom`
  - `React.createElement()`

- `@testing-library/react`
  - `renders`

- `react-icons`

## Investigate

- Dependency array of `useEffect()`
- Controlled vs uncontrolled form elements
- Best practices structuring react projects

## More Information

- [ReactJS](https://reactjs.org/)

- React Developer Tools
  - [React Developer Tools - Chrome Web Store](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
  - [React Developer Tools - Edge Add-ons](https://microsoftedge.microsoft.com/addons/detail/react-developer-tools/gpphkfbcpidddadnkolkpfckpihlkkil)
  - [React Developer Tools - Firefox Add-ons](https://addons.mozilla.org/en-GB/firefox/addon/react-devtools/)

  > Enable _Allow access to file URLs_ in the extension

- [Create React App](https://create-react-app.dev/)

- [React Icons](https://react-icons.github.io/react-icons/)

- [Tailwind CSS](https://tailwindcss.com/)
  - [Install Tailwind CSS with Create React App](https://tailwindcss.com/docs/guides/create-react-app)

- Sandbox & playgrounds
  - [CodeSandbox](https://codesandbox.io/)
  - [Glitch](https://glitch.com/)
