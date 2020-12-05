FROM alpine:latest

RUN apk update \
        && apk add influxdb \
				&& mkdir -p /etc/influxdb

COPY influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086
WORKDIR /

CMD ["influxd"]
