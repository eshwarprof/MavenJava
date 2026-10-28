```dockerfile
# Stage 1: Build the Maven web application
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

# Stage 2: Run the application using Tomcat
FROM tomcat:10.1-jdk17-temurin

COPY --from=build /app/target/MavenJava.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
```