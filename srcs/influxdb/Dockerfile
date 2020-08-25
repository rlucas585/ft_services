# Dockerfile for InfluxDB

FROM alpine:edge

RUN apk update \
        && apk add influxdb

CMD ["influxd", "-config", "/etc/influxdb.conf"]
