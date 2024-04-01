FROM busybox:1.35

# Create a non-root user to own the files and run our server
RUN adduser -D static
USER static
WORKDIR /home/static

# Copy the static website
# Use the .dockerignore file to control what ends up inside the image!
COPY . .

# Run busybox command to echo $APPS > apps
CMD ["busybox", "sh", "-c", "echo $APPS > apps"]

# Run BusyBox httpd
CMD ["busybox", "httpd", "-f", "-v", "-p", "3000"]