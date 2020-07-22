FROM alpine:edge

RUN apk update \
		&& apk add nginx \
		&& apk add openssh-server \
		&& apk add supervisor \
		&& mkdir -p /run/nginx \
		&& mkdir -p /var/www/html \
		&& mkdir -p /sec

# To allow ssh as root with a password:

RUN ssh-keygen -A \
		&& echo 'root:codam2020' | chpasswd

COPY server.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/html/index.html
COPY localhost.key /sec/localhost.key
COPY localhost.cert /sec/localhost.cert
COPY supervisord.conf /etc/supervisord.conf
COPY sshd_new_config /etc/ssh/sshd_config

EXPOSE 22 80 443

WORKDIR /usr/www/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
# CMD ["nginx", "-g", "daemon off;"];
