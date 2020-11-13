# tomcat issue: session listener

Missing `javamelody.jar` in `tomcat/lib`

```
13-Nov-2020 12:53:05.657 SEVERE [teststaff.koi.edu.au-startStop-1] org.apache.catalina.core.StandardContext.listenerStart Error configuring application listener of class net.bull.javamelody.SessionListener
 java.lang.ClassNotFoundException: net.bull.javamelody.SessionListener
	at org.apache.catalina.loader.WebappClassLoaderBase.loadClass(WebappClassLoaderBase.java:1333)
	at org.apache.catalina.loader.WebappClassLoaderBase.loadClass(WebappClassLoaderBase.java:1167)
	at org.apache.catalina.core.DefaultInstanceManager.loadClass(DefaultInstanceManager.java:509)
	at org.apache.catalina.core.DefaultInstanceManager.loadClassMaybePrivileged(DefaultInstanceManager.java:490)
	at org.apache.catalina.core.DefaultInstanceManager.newInstance(DefaultInstanceManager.java:118)
	at org.apache.catalina.core.StandardContext.listenerStart(StandardContext.java:4775)
	at org.apache.catalina.core.StandardContext.startInternal(StandardContext.java:5314)
	at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
	at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase.java:753)
	at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:729)
	at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:717)
	at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.java:1092)
	at org.apache.catalina.startup.HostConfig$DeployDirectory.run(HostConfig.java:1834)
	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)
	at java.util.concurrent.FutureTask.run(FutureTask.java:266)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
	at java.lang.Thread.run(Thread.java:745)
```
