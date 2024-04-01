FROM lipanski/docker-static-website:latest

COPY . .

CMD ["/busybox", "httpd", "-f", "-v", "-p", "3000", "-c", "httpd.conf"]