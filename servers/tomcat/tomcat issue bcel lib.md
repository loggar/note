# tomcat issue: `bcel` lib

```
SEVERE: Unable to process Jar entry [META-INF/versions/9/module-info.class] from Jar [jar:file:/C:/_workspace_koi/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/KOI_SIMS2/WEB-INF/lib/bcpkix-jdk15on-1.62.jar!/] for annotations
org.apache.tomcat.util.bcel.classfile.ClassFormatException: Invalid byte tag in constant pool: 19
	at org.apache.tomcat.util.bcel.classfile.Constant.readConstant(Constant.java:97)
	at org.apache.tomcat.util.bcel.classfile.ConstantPool.<init>(ConstantPool.java:55)
	at org.apache.tomcat.util.bcel.classfile.ClassParser.readConstantPool(ClassParser.java:176)
	at org.apache.tomcat.util.bcel.classfile.ClassParser.parse(ClassParser.java:85)
	at org.apache.catalina.startup.ContextConfig.processAnnotationsStream(ContextConfig.java:2045)
	at org.apache.catalina.startup.ContextConfig.processAnnotationsJar(ContextConfig.java:1991)
	at org.apache.catalina.startup.ContextConfig.processAnnotationsUrl(ContextConfig.java:1961)
	at org.apache.catalina.startup.ContextConfig.processAnnotations(ContextConfig.java:1915)
	at org.apache.catalina.startup.ContextConfig.webConfig(ContextConfig.java:1158)
	at org.apache.catalina.startup.ContextConfig.configureStart(ContextConfig.java:780)
	at org.apache.catalina.startup.ContextConfig.lifecycleEvent(ContextConfig.java:305)
	at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(LifecycleSupport.java:95)
	at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBase.java:90)
	at org.apache.catalina.core.StandardContext.startInternal(StandardContext.java:5154)
	at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:147)
	at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1408)
	at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1398)
	at java.util.concurrent.FutureTask.run(FutureTask.java:266)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
```

Try to upgrade the version of TomCat. This is fixed in:

```
- trunk for 9.0.0.M18 onwards
- 8.5.x for 8.5.12 onwards
- 8.0.x for 8.0.42 onwards
- 7.0.x for 7.0.76 onwards
```
