# eclipse 2019-09

```ini
-startup
plugins/org.eclipse.equinox.launcher_1.5.500.v20190715-1310.jar
--launcher.library
plugins/org.eclipse.equinox.launcher.win32.win32.x86_64_1.1.1100.v20190907-0426
-product
org.eclipse.epp.package.jee.product
-showsplash
org.eclipse.epp.package.common
--launcher.defaultAction
openFile
--launcher.defaultAction
openFile
--launcher.appendVmargs
-vm
C:\_dev\Java\jdk1.8.0_191\bin\javaw.exe
-vmargs
-Dosgi.requiredJavaVersion=1.8
-Dosgi.instance.area.default=@user.home/eclipse-workspace
-XX:+UseG1GC
-XX:+UseStringDeduplication
-XX:+AggressiveOpts
--add-modules=ALL-SYSTEM
-Dosgi.requiredJavaVersion=1.8
-Dosgi.dataAreaRequiresExplicitInit=true
-Xss2m
-Xmn512m
-Xms2048m
-Xmx4096m
--add-modules=ALL-SYSTEM

```
