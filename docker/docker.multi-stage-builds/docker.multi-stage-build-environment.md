```dockerfile
FROM node:13.12.0 AS development

ENV CI=true
ENV PORT=3000

WORKDIR /code
COPY package.json package-lock.json /code/
RUN npm ci
COPY src /code/src

CMD [ "npm", "start" ]

FROM development AS builder

RUN npm run build

FROM nginx:1.17.9 AS production

COPY --from=builder /code/build /usr/share/nginx/html
```

```
$ docker build --target development -t repository/image_name:development .
```

```
$ docker run -e CHOKIDAR_USEPOLLING=true -v ${PWD}/src/:/code/src/ repository/image_name:development
```
