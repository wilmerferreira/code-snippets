# JavaScript

- `Object.create`: allows create an objects with the properties descriptors
- `Object.defineProperty`: sets some configuration about the property and also allow us define the getter and setter functions.
- `Object.getOwnPropertyDescriptor`: gets the info about the property
  - value: the current object value.
  - writable: indicates in that property is readonly.  
  - enumerable: indicates if that property is "viewable" in a loop function (foreach) or in the json serialization.
  - configurable: indicates if we can change any other property (writable and enumerable), also is not possible delete that property.

## ES2015

## let and const

## function defaults

```js
function printSalary(name = '', salary = 0.0) {
  console.log(name + ': £' + salary)
}

printSalary('Employee Name')
```

## The rest argument

```js
// the emails is the rest argument (like the params in c#)
const save = (firstName, lastName, age, ...emails) => {
  console.log(firstName, lastName, age);

  if (emails)
    console.log(emails);
}

save('David', 'Smith', 33, 'dsmith@personal.com', 'david.smith@company.com');
```

## **spread operator**

```js
const save = (firstName, lastName, age, email) => {
  console.log(firstName, lastName, age);

  if (email)
    console.log(email);
}

const userData = [33, 'david.smith@company.com'];

// this is the spread operator (...)
save('John', 'Jones', ...otherUser);
```

## **arrow functions**

```js
// Old style
var showMessageBox = function (message) {
  alert(message);
}

// New style
var showMessageBox = (message) => {
  alert(message);
}

// Or (if is just one command)
var showMessageBox = (message) => alert(message);
```

- object initializer shorthand
  - property value shorthand
  - function shorthand
- object destructuring
- function shorthand
  [6 Ways to declare javascript functions](https://dmitripavlutin.com/6-ways-to-declare-javascript-functions/)

## string interpolation

```js
let firstName = 'David';
let age = 18;
let text = `First name: ${firstName}\nAge:${age}`;
```

## Object.assign

```js
function doSomething(options = {}) {
  let defaults = {
    // ...
  };

  let settings = Object.assign({}, defaults, settings);
}
```

## Array destructuring

```js
let users = ['One', 'Two', 'Three'];

// Old way
let oldWay1 = users[0];
let oldWay2 = users[1];
let oldWay3 = users[2];

// New way
let [a1, a2, a3] = users;

// New way (ignoring items)
let [b1, , b3] = users;

// New way (using rest)
let [c1, ...cN] = users;
```

## For/of loops

```js
let users = ['One', 'Two', 'Three'];

for (let i in users) {
  var user = users[i];
  console.log(user);
}

for (let user of users) {
  console.log(user);
}
```

## Symbol.iterator

## Array.find()

## Map and WeakMap

- We can add/set elements with ```set(key, value)```
- get(key)
- has(key)
- delete(key)

`WeakMaps` can only have **Objects** as keys

```js
let recentPosts = new Map();

recentPosts.set("Sam"  , "ES2015");
recentPosts.set("Tyler", "CoffeeScript");
recentPosts.set("Brook", "TypeScript");

for (let [user, postTitle] of recentPosts) {
  console.log(`${user} = ${postTitle}`);
}
```

## **Set** and **WeakSet**

- Use ```add(item)``` to add new items to the set.
- ```has(item)```

## **class** (Syntactic Sugar)

- `constructor` _function_
- `extends` _keyword_
- `super()` _function_ call the parent constructor
- `super` is the _keyword_ that references the parent class

## **export** and **import**
  
- default export
- export with internal functions
- multiple exports
  - exports
    - N exports
    - export with curly braces **{}**

      ```js
      function isTopicValid(topic) {
        const MAX_TITLE_LENGTH = 20;

        let isValid = !(topic.title.length > MAX_TITLE_LENGTH ||
          topic.author.isBlocked);

        return isValid;
      }

      function isEmailAuthorized(email) {
        const EMAIL_DOMAIN = "@codeschool.com";
        return email.indexOf(EMAIL_DOMAIN) > 0;
      }

      export { isTopicValid, isEmailAuthorized };
      ```

  - import as an object
  
    ```js
    import * as xxx from './module-path-without-extension'
    ```

```js
export default function(message) {
  log('Flash message called');
  alert(message);
}

function log(entry) {
  console.log(entry);
}
```

```js
import flashMessage from './flash-message.js'

flashMessage('Hello World');
```

## Promises

- Promise
  - resolve()
  - reject()
- then()
- catch()

## Iterators and Iterables

## **function * ()** generators and **yield**

## **as** _keyword_
