# HTTPS In Development

## Serving HTTPS Directly From The Application

Sometimes security requirements demand end-to-end encryption, or having a reverse proxy just might seem to be overkill on a development environment. Most of the time, it's possible to serve HTTPS directly from your everyday development environment.

Let's take the example of a common stack: a React application with a REST API using express.

### Using Create React App or Webpack Dev Server

Your average React app is bootstraped by `create-react-app`. This awesome tool comes with a lot of built-in features and can handle HTTPS out of the box. To do so, you just have to specify a `HTTPS=true` environment variable when starting the app:

```sh
HTTPS=true npm run start
# or
HTTPS=true yarn start
```

If you want to use your own HTTPS certificate (signed with an authority that your browser trusts), `create-react-app` doesn't let you configure it without ejecting the app (`npm run eject`).

Fortunately, if you do eject CRA, or if your project is bundled with webpack, `webpack-dev-server` is as straightforward as `create-react-app` when it comes to serve HTTPS! It's possible to configure a custom HTTPS certificate with two lines in the Webpack configuration:

```js
//webpack.config.js
const fs = require("fs");
const path = require("path");

module.exports = {
  mode: "production",
  // ...
  devServer: {
    https: {
      key: fs.readFileSync(path.resolve(__dirname, "../../certs/server.key")),
      cert: fs.readFileSync(path.resolve(__dirname, "../../certs/server.crt"))
    },
    port: 3000
  }
};
```

The next time you'll run webpack-dev-server, it will handle HTTPS requests to https://localhost:3000.

> A dev.to reader, Zwerge, found a clever workaround to replace the default HTTPS certificate on the fly:

```json
"scripts": {
    "prestart": "(cat ../../certs/server.crt ../../certs/server.key > ./node_modules/webpack-dev-server/ssl/server.pem) || :",
    "start": "react-scripts start",
  },
```

### Encrypted HTTP/2 With Express And SPDY

Now that we have our frontend part of the app that is served through HTTPS, we have to do the same with our backend.

For this purpose, let's use express and spdy. No wonder why these two libraries names are about SPEED, it's because they are fast to setup!

```js
// server.js
const fs = require("fs");
const path = require("path");
const express = require("express");
const spdy = require("spdy");

const CERTS_ROOT = "../../certs/";

const app = express();

app.use(express.static("static"));

const config = {
  cert: fs.readFileSync(path.resolve(CERTS_ROOT, "server.crt")),
  key: fs.readFileSync(path.resolve(CERTS_ROOT, "server.key"))
};

spdy.createServer(config, app).listen(3000, err => {
  if (err) {
    console.error("An error occured", error);
    return;
  }

  console.log("Server listening on https://localhost:3000.");
});
```

HTTP/2 isn't required to serve HTTPS, it's possible to serve encrypted content with HTTP first of the name, but while we are at serving HTTPS, we can upgrade the HTTP protocol. If you want to know more about the advantages of HTTP/2.
