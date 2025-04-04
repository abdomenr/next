# Use a specific Ubuntu version as the base image
FROM ubuntu:22.04

# Install NGINX and configure it to listen on port 4000
RUN apt-get update -y && apt-get install -y nginx && \
    sed -i 's/80/4000/' /etc/nginx/sites-available/default && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/www/html

# Copy local files into the container
COPY . .

# Expose port 4000
EXPOSE 4000

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]