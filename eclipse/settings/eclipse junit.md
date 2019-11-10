# eclipse junit

## eclipse project

- version: eclipse 2019-06

```
Project Context Menu - Properties - Java Build Path - Add Library - Junit 5
```

`.classpath`

```xml
<classpathentry kind="con" path="org.eclipse.jdt.junit.JUNIT_CONTAINER/5">
  <attributes>
    <attribute name="org.eclipse.jst.component.nondependency" value=""/>
  </attributes>
</classpathentry>
```

## Maven

`pom.xml`

```xml
<properties>
  <java.version>1.8</java.version>
  <junit.platform.version>1.1.0</junit.platform.version>
  <junit.jupiter.version>5.4.2</junit.jupiter.version>
  <junit.vintage.version>5.4.2</junit.vintage.version>
</properties>
```

```xml
<!-- Surefire Plugin 2.22.0: JUnit 5 support -->
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-surefire-plugin</artifactId>
  <version>2.22.1</version>
</plugin>
```

```xml
<!-- junit 5 -->
<dependency>
  <groupId>org.junit.platform</groupId>
  <artifactId>junit-platform-surefire-provider</artifactId>
  <version>${junit.platform.version}</version>
</dependency>
<dependency>
  <groupId>org.junit.jupiter</groupId>
  <artifactId>junit-jupiter-engine</artifactId>
  <version>${junit.jupiter.version}</version>
</dependency>
<dependency>
  <groupId>org.junit.jupiter</groupId>
  <artifactId>junit-jupiter-api</artifactId>
  <version>${junit.jupiter.version}</version>
  <scope>test</scope>
</dependency>
<dependency>
  <groupId>org.junit.vintage</groupId>
  <artifactId>junit-vintage-engine</artifactId>
  <version>${junit.vintage.version}</version>
</dependency>
```

## Gradle

`build.gradle`

```
apply plugin: 'java'

repositories {
    mavenCentral()
}

dependencies {
    testImplementation('org.junit.jupiter:junit-jupiter-api:5.4.2')
    testRuntime('org.junit.jupiter:junit-jupiter-engine:5.4.2')
}
```

If you want to run tests which use both JUnit 4 and 5:

```
apply plugin: 'java'

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(
            'junit:junit:4.12',
            'org.junit.jupiter:junit-jupiter-api:5.4.2'
    )
    testRuntime(
            'org.junit.jupiter:junit-jupiter-engine:5.4.2',
            'org.junit.vintage:junit-vintage-engine:5.4.2'
    )
}
```

Enabling the Gradle's Native JUnit 5 Support

```
apply plugin: 'java'

repositories {
    mavenCentral()
}

dependencies {
    testImplementation('org.junit.jupiter:junit-jupiter-api:5.4.2')
    testRuntime('org.junit.jupiter:junit-jupiter-engine:5.4.2')
}

test {
    useJUnitPlatform()
}
```
