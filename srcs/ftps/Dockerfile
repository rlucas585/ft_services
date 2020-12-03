FROM alpine:latest

RUN apk update \
	&& apk add gettext curl jq vsftpd

RUN mkdir -p /sec \
		&& mkdir -p /var/ftp

COPY ftps.key /sec/ftps.key
COPY ftps.cert /sec/ftps.cert
COPY entry.sh /tmp/entry.sh
COPY get_external_ip_addresses.sh /tmp/get_external_ip_addresses.sh
COPY vsftpd.conf /tmp/vsftpd.conf

RUN chmod +x /tmp/*.sh

WORKDIR /var/ftp

EXPOSE 20 21 30000

CMD ["/bin/sh", "/tmp/entry.sh"]
