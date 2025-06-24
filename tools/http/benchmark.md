## `ab` test

```
$ ab -n 100 "https://google.com.au/"
This is ApacheBench, Version 2.3 <$Revision: 1913912 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking google.com.au (be patient).....done


Server Software:        gws
Server Hostname:        google.com.au
Server Port:            443
SSL/TLS Protocol:       TLSv1.2,ECDHE-ECDSA-CHACHA20-POLY1305,256,256
Server Temp Key:        ECDH X25519 253 bits
TLS Server Name:        google.com.au

Document Path:          /
Document Length:        223 bytes

Concurrency Level:      1
Time taken for tests:   29.959 seconds
Complete requests:      100
Failed requests:        0
Non-2xx responses:      100
Total transferred:      83800 bytes
HTML transferred:       22300 bytes
Requests per second:    3.34 [#/sec] (mean)
Time per request:       299.593 [ms] (mean)
Time per request:       299.593 [ms] (mean, across all concurrent requests)
Transfer rate:          2.73 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:      118  136  13.0    134     211
Processing:   141  163  86.7    148     799
Waiting:      141  162  86.8    147     798
Total:        264  299  87.2    282     939

Percentage of the requests served within a certain time (ms)
  50%    282
  66%    289
  75%    295
  80%    297
  90%    307
  95%    345
  98%    835
  99%    939
 100%    939 (longest request)
```
