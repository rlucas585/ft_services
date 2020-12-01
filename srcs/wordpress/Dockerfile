FROM alpine:latest

RUN apk update \
			&& apk add tar \
			&& apk add nginx \
			&& apk add supervisor
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
RUN apk add gettext \
			&& apk add curl
RUN mkdir -p /run/nginx \
			&& mkdir -p /sec

# COPY wordpress-5.5.3.tar.gz /var/www/html/wordpress.tar.gz
COPY server.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

# RUN tar -xzf /var/www/html/wordpress.tar.gz --strip-components=1 -C /var/www/html/wordpress/
# RUN rm -rf /var/www/html/wordpress.tar.gz

RUN adduser -D rlucas

COPY wp-config.php /tmp/wp-config.php
COPY wp-config.php /var/www/html/wordpress
COPY entry.sh /tmp/entry.sh

EXPOSE 5050

WORKDIR /var/www/html

RUN chmod +x /tmp/entry.sh

CMD ["/bin/sh", "/tmp/entry.sh"]
# CMD ["/bin/sh"]
