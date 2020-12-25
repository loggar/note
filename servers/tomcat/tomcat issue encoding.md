# issues : encoding

## Invalid character found in the request target. The valid characters are defined in RFC 7230 and RFC 3986

```
	java.lang.IllegalArgumentException: Invalid character found in the request target [/?a=fetch&content=<php>die(@md5(HelloThinkCMF))</php>]. The valid characters are defined in RFC 7230 and RFC 3986
		at org.apache.coyote.http11.Http11InputBuffer.parseRequestLine(Http11InputBuffer.java:490)
		at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:261)
		at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)
		at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:888)
		at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1597)
		at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)
		at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
		at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
		at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
		at java.lang.Thread.run(Thread.java:748)
```

`server.xml`

```xml
<Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443"
            compression="on"
           URIEncoding="UTF-8"
           compressableMimeType="text/html,text/xml"
           relaxedQueryChars="[,]"
 />
```
