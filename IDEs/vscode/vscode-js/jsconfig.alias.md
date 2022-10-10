# `jsconfig.js` path alias

`webpack.config.js`

```js
const path = require("path");

module.exports = {
  resolve: {
    alias: {
      "@": path.resolve("resources/js"),
      "@Components": path.resolve("resources/js" / Components),
    },
  },
};
```

```js
// import Input from ../../Components/Input.vue
import Input from @/Components/Input.vue
import Input from @Components/Input.vue
```

The one thing that is missing here, if you're using VSCode, is your IDE won't be able to help you with auto-completing your paths. This is where the `jsconfig.json` file comes into play.

`jsconfig.json`

```json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["resources/js/*"],
      "@Components/*": ["resources/js/Components/*"]
    }
  },
  "exclude": ["node_modules", "public"]
}
```

Note you might have to restart VSCode for jsconfig.json to take effect.

Now, when you type `import Input from '@"`. You will start to see your folder structure and the files that are in each directory.
