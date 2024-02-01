# Vue

## CDNs

- vue.js
  - `https://unpkg.com/vue`
  - `https://unpkg.com/vue/dist/vue.min.js`
  - `https://unpkg.com/vue@2.4.2`
  - `https://unpkg.com/vue@2.4.2/dist/vue.min.js`
- axios
  - `https://unpkg.com/vue/dist/vue.min.js`

## Vue **app**

```js

// Define a Vue app
var growler = new Vue({
  el: '#growler',
  data: {
    appName: 'Growler',
    pColor: '#ff0000',
    pFontFamily: 'Consolas',
    pFontWeight: 'bold',
    pMargin: 20,
    isOnline: true
  }
});

// Define a Vue component, the first argument it's the element name
Vue.component('main-header', {
  props: ['text'],
  template: '<h1>{{ text }}</h1>'
});

```

## Attributes

| Attribute         | Description                   | Notes                                                                                  |
|-------------------|-------------------------------|----------------------------------------------------------------------------------------|
| v-text            | Renders simple text           |                                                                                        |
| v-once            | Renders simple text (once)    | later changes won't affect this element, this improves performance                     |
| v-html            | Renders html                  |                                                                                        |
| v-bind:attribute  | Bind data                     | if the attribute has 'dashes' remove the dash and change the next letter to uppercase  |
| v-model           | Bind input elements (two-way) | it can be used in inputs, text areas, checkboxes                                       |
| v-on:event        | Responds to an specific event | e.g. v-on:click="eventName"                                                            |

- conditionals
  - `v-cloak`
  - `v-if`
  - `v-else-if`
  - `v-else`
  - `v-show`

- loops
  - `v-for`
    - item in list / num of count
    - (v, k) in list#
    - (v, k, i) in list

### Shorthands

- The shorthand for the _bind_ attribute is the colon ":" character followed by the attribute name, e.g. the shorthand for`v-bind:href` is `:href`
- The shorthand for the _on_ attribute is the at "@" character followed by the attribute name, e.g. the shorthand for`v-on:click` is `@click`

### Modifiers

- trim
- number
- lazy
- capture
- prevent
- stop
- self

## [Filters](https://www.npmjs.com/package/vue2-filters)

| Filter        | Description                               |
|---------------|-------------------------------------------|
| capitalize    | Capitalize the value                      |
| currency      | Append the currency symbol to a value     |
| json          | Converts the value to a json stringigy    |
| lowercase     | Change the test to lowercase              |
| uppercase     | Change the test to uppercase              |
| pluralize     | Pluralize a word                          |

> Filters cannot be used with v-html and v-text

## Filters, Computed properties, methods and watchers

- Computed properties are getters by default (although can have setters as well), and the returning value is cached until the dependencies change.

|                                   | Filters   | Computed  | Methods   | Watchers  |
|-----------------------------------|-----------|-----------|-----------|-----------|
| React to data changes             | Yes       | Yes       | No        | Yes       |
| Reusable across apps              | Yes       | No        | No        | No        |
| Cached based on dependencies      | No        | Yes       | No        | No        |
| Appropriate for async operations  | No        | No        | Yes       | Yes       |
| Accepts parameters                | Yes       | No        | Yes       | No        |
| Fires after creation              | Yes       | Yes       | Possible  | No        |

## User events

- the functions should be created in the **methods** property in the vue object.

e.g.
    v-on:click
or (the shorthand syntax)
    @click

## Review

- Events capture/bubble
- arrays
  - Vue.set instead array[i]

## PENDING

- Transitions
- Routing
- State management
- Server-side rendering

## More Information

- [PluralSight](https://app.pluralsight.com/library/courses/vuejs-getting-started)
- [github](https://github.com/ecofic/course-vue-getting-started)
