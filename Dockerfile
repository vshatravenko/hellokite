FROM nginx:1.13
# MAINTAINER Some Name <email@hellokite.com>

RUN echo "Hello, Hellokite!" > /usr/share/nginx/html/index.html
