```dockerfile
FROM maven:3.6.3-jdk-11 AS builder
WORKDIR /workdir/server
COPY pom.xml /workdir/server/pom.xml
RUN mvn dependency:go-offline

RUN mvn package

FROM openjdk:11-jre-slim
RUN addgroup -S java && adduser -S javauser -G java
USER javauser

EXPOSE 8080
COPY --from=builder /workdir/server/target/project-0.0.1-SNAPSHOT.jar /project-0.0.1-SNAPSHOT.jar

CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/project-0.0.1-SNAPSHOT.jar"]
```
