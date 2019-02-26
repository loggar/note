```
docker  run --rm --name get -v $PWD:/crawler -w /crawler/bciscrapy bcicrawler /bin/bash run.sh > /root/crawl.log 2>&1
```

* `$PWD`: current command
