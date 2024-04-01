FROM lipanski/docker-static-website:latest

ARG APPS

RUN echo "$APPS" > /apps

COPY . .

CMD ["/busybox", "httpd", "-f", "-v", "-p", "3000", "-c", "httpd.conf"]
