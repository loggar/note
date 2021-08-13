# docker export import

export a container

```
docker export a8b14091b4e7 > calc-container.tar
```

import a exported container as an image

```
docker import calc-container.tar calcfs:latest
```
