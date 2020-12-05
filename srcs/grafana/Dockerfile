FROM alpine:latest

RUN apk update \
			&& echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
			&& apk add grafana \
			&& mkdir -p /var/lib/grafana/dashboards

COPY grafana-dashboard-provider.yml /usr/share/grafana/conf/provisioning/dashboards
COPY influxdb-datasource.yml /usr/share/grafana/conf/provisioning/datasources
COPY dashboards/* /var/lib/grafana/dashboards/

EXPOSE 3000

WORKDIR /usr/share/grafana

CMD ["grafana-server"]
