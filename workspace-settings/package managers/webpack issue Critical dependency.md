## Critical dependency: the request of a dependency is an expression @

```
./node_modules/colors/lib/colors.js
  127:29  warning  Critical dependency: the request of a dependency is an expression  @
                   ./node_modules/colors/lib/colors.js  @ ./node_modules/colors/safe.js  @
                   ./node_modules/winston/lib/winston/config.js  @
                   ./node_modules/winston/lib/winston.js  @ ./lib/logger.winston.js  @
                   ./bin/www.js  @ multi ./bin/www

./node_modules/express/lib/view.js
  81:13  warning  Critical dependency: the request of a dependency is an expression  @
                  ./node_modules/express/lib/view.js  @
                  ./node_modules/express/lib/application.js  @
                  ./node_modules/express/lib/express.js  @
                  ./node_modules/express/index.js  @
                  ./src-server/app-class-enroll-status.js  @ ./bin/www.js  @ multi
                  ./bin/www
```


solve : 

```
// webpack.config.server.prod.js

const nodeExternals = require('webpack-node-externals')

module.exports = {
	externals: [nodeExternals({
	})],
}
```