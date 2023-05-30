
# Use a base image with Java pre-installed
FROM eclipse-temurin:17
# Set the working directory inside the container
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy the pom.xml file to the container
COPY pom.xml .

# Resolve Maven dependencies (only the dependencies are needed for this step)
RUN ["mvn", "dependency:resolve", "--fail-never"]

# Copy the source code to the container
COPY src ./src

# Build the application using Maven
RUN ["mvn", "package"]

# Copy the packaged Spring Boot application JAR file into the container
# COPY target/period-app-0.0.1-SNAPSHOT.jar /app/period-app-0.0.1-SNAPSHOT.jar
# Expose the port that your Spring Boot application listens on
EXPOSE 8890
# Set the command to run your Spring Boot application when the container starts
CMD ["java", "-jar", "period-app-0.0.1-SNAPSHOT.jar"]
