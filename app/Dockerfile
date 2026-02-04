FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

RUN apk add --no-cache bash

RUN echo "server {" > /etc/nginx/conf.d/default.conf && \
    echo "  listen 80;" >> /etc/nginx/conf.d/default.conf && \
    echo "  location / {" >> /etc/nginx/conf.d/default.conf && \
    echo "    root /usr/share/nginx/html;" >> /etc/nginx/conf.d/default.conf && \
    echo "    index index.html;" >> /etc/nginx/conf.d/default.conf && \
    echo "  }" >> /etc/nginx/conf.d/default.conf && \
    echo "  location /hostname {" >> /etc/nginx/conf.d/default.conf && \
    echo "    return 200 \$hostname;" >> /etc/nginx/conf.d/default.conf && \
    echo "  }" >> /etc/nginx/conf.d/default.conf && \
    echo "}" >> /etc/nginx/conf.d/default.conf

EXPOSE 80
