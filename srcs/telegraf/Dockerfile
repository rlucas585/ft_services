FROM alpine:latest

RUN apk update \
			&& echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
			&& apk add telegraf \
			&& mkdir -p /etc/telegraf

COPY telegraf.conf /etc/telegraf/telegraf.conf

CMD ["telegraf", "--config", "/etc/telegraf/telegraf.conf"]
