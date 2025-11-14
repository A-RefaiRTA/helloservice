# ==========================
# Stage 1: Build the JAR file
# ==========================
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# ==========================
# Stage 2: Create the runtime image
# ==========================
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/helloservice-0.0.1-SNAPSHOT.jar app.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
