# Dockerfile for InfluxDB

FROM alpine:latest

RUN apk update \
        && apk add influxdb

COPY influxdb.conf /etc/influxdb.conf
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

EXPOSE 8086
VOLUME /var/lib/influxdb
WORKDIR /

# RUN ./entry.sh
# CMD ["/entry.sh"]
CMD ["influxd"]

# RUN influxd -config /etc/influxdb.conf & \
# 			sleep 3 \
# 			&& influx -execute "CREATE USER telegraf WITH PASSWORD 'password' WITH ALL PRIVILEGES"

# CMD ["influxd", "-config", "/etc/influxdb.conf"]
# CMD ["/entry.sh"]
