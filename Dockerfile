# Use a lightweight Java runtime
FROM eclipse-temurin:17-jdk-jammy
# Set working directory
WORKDIR /app

# Copy the jar file from "target" into the container
COPY target/helloservice.jar /app.jar

# Expose the app port
EXPOSE 8080

# Set the entrypoint to run the JAR file
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Run the app with Java
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
FROM openjdk:17-jdk-slim-bullseye

