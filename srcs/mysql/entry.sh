# Substitute environment variables in the config file
envsubst < /tmp/my.cnf > /etc/my.cnf

# Install mysqldb and specify location for database volume
mysql_install_db --user=$MYSQL_USERNAME --ldata=/var/lib/mysql

## Collect SQL commands into a single file
cat /tmp/my_tables.sql >> /tmp/create_tables.sql

## Substitute environment variables in final SQL file
envsubst < /tmp/create_tables.sql > /tmp/final.sql

## Start mysqld with initial SQL commands
mysqld --console --init_file=/tmp/final.sql
