#!/bin/sh
# exec influxd -config /etc/influxdb.conf &
# influx -execute "CREATE DATABASE $INFLUXDB_DATABASE"
# influx -execute "CREATE USER $INFLUXDB_USERNAME WITH PASSWORD '$INFLUXDB_PASSWORD' WITH ALL PRIVILEGES"
# influx -execute "CREATE DATABASE test"
# influx -execute "CREATE USER test WITH PASSWORD 'test' WITH ALL PRIVILEGES"
# set -e
INIT_QUERY="CREATE USER $INFLUXDB_USERNAME WITH PASSWORD '$INFLUXDB_PASSWORD' WITH ALL PRIVILEGES"
# INIT_QUERY="CREATE USER test WITH PASSWORD 'test' WITH ALL PRIVILEGES"
influxd &
for i in {30..0}; do
	if influx -execute "$INIT_QUERY" &> /dev/null; then
		break
	fi
	echo 'influxdb init process in progress...'
	sleep 1
done
fg
