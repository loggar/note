# awesome-npx

* https://github.com/suarasaur/awesome-npx

packages and resources that work really well with `npx`.

## useful
alex - check text or markdown documents for insensitive or inconsiderate writing
```
npx alex README.md cat README.md | npx alex
```

decode-zhuyin - decode Chinese word to Zhuyin password
```
npx decode-zhuyin <text>
```

goops - add gitignore rules heuristically based on files in your current directory
```
npx goops
```

http-server - run a static web server in your current directory
```
npx http-server
```

json-server - run a mock REST API server with JSON-based response configuration
```
npx json-server https://raw.githubusercontent.com/typicode/jsonplaceholder/master/data.json
```

NodeSchool Workshoppers - Learn something new!
```
npx learnyounode npx how-to-npm npx git-it npx elementary-electron
```

okimdone - execute a long-running command and be told out loud when it's done
```
npx okimdone npm install
```

pa11y - check websites for accessibility issues
```
npx pa11y http://example.com
```

shx - portable shell commands like ls, cp, rm
```
npx shx ls npx shx rm -rf /tmp
```

strip-ansi-cli - remove terminal color codes from piped text
```
echo -e "\033[33m hello" | npx strip-ansi-cli
```

## node.js development
dist-upgrade - install the latest global node and npm
```
npx dist-upgrade
```

npm-check - interactively update npm dependencies
```
npx npm-check npx npm-check --skip-unused --update
```

nsp - scan your npm project for vulnerabilities and security alerts
```
npx nsp check
```

snyk - scan for vulnerabilities in your project and its dependencies and even fix them (requires account with service)
```
npx snyk test npx snyk monitor
```

sort-package-json - sort your package.json keys
```
npx sort-package-json
```