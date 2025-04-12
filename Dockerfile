
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy local files into the container
COPY . .

# Expose port 8086
EXPOSE 8086

# Start the Python HTTP server
CMD ["python3", "-m", "http.server", "8086"]
