# Netbeans

## Templates

### Java class templates

```
Tools - Templates - Java - Java Class : Open in editor
```

Default template:

```
<#assign licenseFirst = "/*">
<#assign licensePrefix = " * ">
<#assign licenseLast = " */">
<#include "${project.licensePath}">

<#if package?? && package != "">
package ${package};

</#if>
/**
 *
 * @author ${user}
 */
public class ${name} {

}

```

Plain Java Template:

```
<#if package?? && package != "">
package ${package};

</#if>
public class ${name} {

}

```
