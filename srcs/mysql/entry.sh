# Temporary - only to be used when testing container in isolation from kubernetes
# export MYSQL_USERNAME=mysql
# export MYSQL_PASSWORD=codam
# export MYSQL_DB=wordpress

# Substitute environment variables in the config file
envsubst < /tmp/my.cnf > /etc/my.cnf

echo "$MYSQL_USERNAME" is the mysql username

# Install mysqldb and specify location for database volume
mysql_install_db --user=$MYSQL_USERNAME --basedir=/usr --datadir=/var/lib/mysql

## Substitute environment variables in final SQL file
envsubst < /tmp/my_tables.sql > /tmp/my_tables_env.sql

## Collect SQL commands into a single file
cat /tmp/my_tables_env.sql >> /tmp/create_tables.sql

## Start mysqld with initial SQL commands
mysqld -u $MYSQL_USERNAME --console --init_file=/tmp/create_tables.sql
