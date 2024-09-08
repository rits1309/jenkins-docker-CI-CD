# Use the official Python 2 image from the Docker Hub
FROM python:2.7-slim

# Set the working directory in the container
WORKDIR /app

# Copy the index.html file into the container
COPY index.html /app/

# Expose port 8000 to access the application
EXPOSE 8000

# Run a simple HTTP server using Python 2
CMD ["python", "-m", "SimpleHTTPServer", "8000"]

