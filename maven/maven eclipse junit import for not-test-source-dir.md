# maven does not import junit lib `<scope>test</scope>` for source directory.

it does import junit for only test source directory.

```
The import org.junit cannot be resolved
```

## solve

`java build path` - `Library` - `Add Library`

add `Junit 5`

then this worning appears.

```
Classpath entry org.eclipse.jdt.junit.JUNIT_CONTAINER/5 will not be exported or published. Runtime ClassNotFoundExceptions may result.
```

then add classpath entry for junit.

`.classpath`

```xml
<classpathentry kind="con" path="org.eclipse.jdt.junit.JUNIT_CONTAINER/5">
  <attributes>
    <attribute name="org.eclipse.jst.component.dependency" value="/WEB-INF/lib" />
  </attributes>
</classpathentry>
```

