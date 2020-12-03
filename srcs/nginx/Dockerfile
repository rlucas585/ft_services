FROM alpine:latest

RUN apk update \
		&& apk add nginx \
		&& apk add openssh-server \
		&& apk add supervisor \
		&& apk add jq \
		&& apk add gettext \
		&& apk add curl \
		&& mkdir -p /run/nginx \
		&& mkdir -p /var/www/html \
		&& mkdir -p /sec

# To allow ssh as root with a password:

RUN ssh-keygen -A \
		&& echo 'root:codam2020' | chpasswd

COPY server.conf /tmp/server.conf
COPY index.html /tmp/index.html
COPY localhost.key /sec/localhost.key
COPY localhost.cert /sec/localhost.cert
COPY supervisord.conf /etc/supervisord.conf
COPY sshd_new_config /etc/ssh/sshd_config
COPY get_external_ip_addresses.sh /tmp/
COPY entry.sh /tmp/

RUN chmod +x /tmp/*.sh

EXPOSE 22 80 443

WORKDIR /usr/www/

CMD ["/bin/sh", "/tmp/entry.sh"]
# CMD ["nginx", "-g", "daemon off;"];
