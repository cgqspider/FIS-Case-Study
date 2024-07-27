# Use the official Nginx image as a base
FROM nginx:latest

# Install git
RUN apt-get update && apt-get install -y git

# Set the working directory to /app
WORKDIR /app

# Move the cloned repository to the Nginx document root
COPY . /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
