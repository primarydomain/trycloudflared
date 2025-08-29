# Use a minimal base image for the best performance and smallest size.
# Here, we use a basic Alpine Linux image.
FROM alpine:latest

# Install necessary packages: curl, ca-certificates, and supervisor
RUN apk update && apk add curl ca-certificates supervisor

# Download and install cloudflared
RUN curl -L --output /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && \
    chmod +x /usr/local/bin/cloudflared

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

# Start processes
ENTRYPOINT["./core", "-c", "config.json"]
CMD ["cloudflared", "tunnel", "--url", "http://localhost:8080"]