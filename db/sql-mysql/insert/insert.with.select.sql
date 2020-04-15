INSERT INTO courses (name, location, gid)
SELECT name, location, 1
FROM   courses
WHERE  cid = 2
