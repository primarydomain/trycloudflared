# Use a minimal base image for the best performance and smallest size.
# Here, we use a basic Alpine Linux image.
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy your binary and config.json into the container
# Ensure your renamed binary and config.json are in the same local directory
COPY core.zip .
COPY config.json .

# Set permissions for the binary to be executable
RUN unzip core.zip && rm core.zip

# Expose the port that your application uses. 
# You can find this in your config.json. Zeabur expects it to be dynamically assigned.
# The command below uses an environment variable for the port, which is good practice.
EXPOSE 8080

# Define the command to run your application.
# The `exec` form is best for running as the container's main process.
CMD ["./core", "-c", "config.json"]