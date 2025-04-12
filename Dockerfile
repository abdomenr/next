# Use a specific Ubuntu version as the base image
FROM ubuntu:22.04

# Install NGINX and configure it to listen on port 8086
RUN apt-get update -y && apt-get install -y nginx && \
    sed -i 's/80/8086/' /etc/nginx/sites-available/default && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user for better security
RUN adduser --system --no-create-home nginx

# Set the working directory
WORKDIR /var/www/html

# Copy local files into the container
COPY . .

# Expose port 8086
EXPOSE 8086

# Switch to the non-root user
USER nginx

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

# Add a health check to monitor NGINX
HEALTHCHECK --interval=30s --timeout=3s \
    CMD curl -f http://localhost:8086 || exit 1
