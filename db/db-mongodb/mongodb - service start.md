## Start Service and Shell

* Start Server

```
C:/_dev/mongodb/mongodb-win64-3.4/bin/mongod.exe --dbpath C:/_dev/mongodb/mongodb-win64-3.4/data/db_sample
```

* Client Shell

```
C:\_dev\mongodb\mongodb-win64-3.4\bin\mongo.exe
```

## Mongo Shell

```
> show dbs
admin      0.000GB
local      0.000GB
photo_app  0.000GB
test       0.000GB
```

```
> use test
switched to db test
```

```
> show collections
somemodels
tasks
test
```

```
db.test.save({a:1})
db.test.find()
```

```
> db.test.find()
{ "_id" : ObjectId("58912454aec8010e0a0ed684"), "a" : 1 }
{ "_id" : ObjectId("589125d1aec8010e0a0ed685"), "a" : 1, "b" : "aaa" }
```

## Shell Log

```
> show logs
global
startupWarnings
> show log global
```