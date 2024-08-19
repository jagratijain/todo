# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built jar file from the target directory to the working directory inside the container
COPY target/ToDo-App-0.0.1-SNAPSHOT.jar /app/todo-app.jar

# Expose the port the app runs on
EXPOSE 8091

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app/todo-app.jar"]
