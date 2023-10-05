# Angular: Styling

```ts
// app.component.ts


```

View Encapsulation Modes:

- `None`: this tells angular to don't do anything with the CSS
- `Native` (deprecated, use `ShadowDom` instead)
- `ShadowDom`: Restructures the html/css to avoid conflicts with other components' assets (this feature is not available to all browsers)
- `Emulated` (default option): Rename the css selectors to scope them to the specific component

## Special Angular CSS selectors

- `:host`
- `:host-context(selector's context) child selector`
