FROM alpine:edge

RUN apk update \
		&& apk add nginx \
		&& apk add openssh-server \
		&& mkdir -p /run/nginx \
		&& mkdir -p /var/www/html \
		&& mkdir -p /sec

COPY server.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/html/index.html
COPY localhost.key /sec/localhost.key
COPY localhost.cert /sec/localhost.cert

EXPOSE 22 80 443

WORKDIR /usr/www/

CMD ["nginx" ,"-g", "daemon off;"]
# CMD nginx;
