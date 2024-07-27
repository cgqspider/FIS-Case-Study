# Use the official Nginx image as a base
FROM nginx:latest

# Install git
RUN apt-get update && apt-get install -y git

# Set the working directory to /app
WORKDIR /app

# Clone the HTML repository
RUN git clone https://github.com/cgqspider/FIS-Case-Study.git

#refresh the folder
RUN cd FIS-Case-Study && git fetch origin && git reset --hard origin/main

# Move the cloned repository to the Nginx document root
RUN cp FIS-Case-Study/* /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
