ENV_VAR `chokidar` true 

`https://github.com/paulmillr/chokidar`

```
$ docker run -e CHOKIDAR_USEPOLLING=true  -v ${PWD}/src/:/code/src/ -p 3000:3000 repository/image_name
```
