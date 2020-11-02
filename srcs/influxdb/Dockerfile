# Dockerfile for InfluxDB

FROM alpine:latest

RUN apk update \
        && apk add influxdb

CMD ["influxd", "-config", "/etc/influxdb.conf"]
