# Build stage
FROM maven:3.9.4-eclipse-temurin-17 as build
WORKDIR /build
# copy pom and source
COPY pom.xml .
COPY src ./src
# package application (creates target/*.jar)
RUN mvn -B clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /build/target/helloservice-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
