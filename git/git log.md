## git log

```
git log
```

```
git log -p -2
```

```
git log --pretty=format:"%h - %an, %ar : %s"
```

```
git log --pretty=format:"%h %s" --graph
```

```
git log --since=2.weeks
```

```
git log --after="2014-04-29 00:00:00" --before="2014-04-29 23:59:59" \
  --pretty=fuller
```

```
git log  --after="2013-04-29T17:07:22+0200"      \
          --before="2013-04-29T17:07:22+0200" --pretty=fuller
```

```
$ git log --after=2008-06-01 --before=2008-07-01
$ git log --after="2008-06-01T09:00:00+0300" \
    --before="2008-07-01T09:00:00+0300"
```

```
$ git log --pretty="%h - %s" --author=gitster \
       --after="2008-10-01T00:00:00-0400"         \
      --before="2008-10-31T23:59:59-0400" --no-merges -- t/
```