FROM alpine:latest

RUN apk update \
			&& apk add nginx \
			&& apk add supervisor wget curl jq gettext
RUN apk add php7-common \
			php7-fpm \
			php7-opcache \
			php7-gd \
			php7-mysqli \
			php7-zlib \
			php7-curl \
			php7-mbstring \
			php7-json \
			php7-session \
			php7-phar \
			php7-cli \
			php7-zip \
			php7-iconv \
			php7-xml \
			php7-imap \
			php7-cgi \
			fcgi \
			php7-pdo \
			php7-pdo_mysql \
			php7-soap \
			php7-xmlrpc \
			php7-posix \
			php7-mcrypt \
			php7-gettext \
			php7-ldap \
			php7-ctype \
			php7-dom

RUN mkdir -p /run/nginx \
	&& mkdir -p /var/www/html

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /var/www/html

COPY server.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf
COPY config.inc.php /tmp/config.inc.php
COPY get_external_ip_addresses.sh /tmp/get_external_ip_addresses.sh
COPY entry.sh /tmp/entry.sh

RUN chmod 777 /var/www/html

WORKDIR /var/www/html

RUN chmod +x /tmp/*.sh
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf

CMD ["/bin/sh", "/tmp/entry.sh"]
