FROM alpine:latest

RUN apk update \
		&& apk add mysql mysql-client
RUN apk add gettext
RUN mkdir -p /tmp \
	&& mkdir -p /var/run/mysqld \
	&& chown -R mysql:root /var/run/mysqld

COPY create_tables.sql /tmp/create_tables.sql
COPY my_tables.sql /tmp/my_tables.sql
COPY my.cnf /tmp/my.cnf
COPY entry.sh .

RUN chmod +x ./entry.sh

CMD ["/bin/sh", "./entry.sh"]
