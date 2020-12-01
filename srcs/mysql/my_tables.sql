-- --------------------------------------------------------
-- SQL Commands to set up the default table for mysql
-- --------------------------------------------------------

CREATE USER IF NOT EXISTS '${MYSQL_USERNAME}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
CREATE DATABASE IF NOT EXISTS `${MYSQL_DB}` CHARACTER SET utf8 COLLATE utf8_bin;
-- SET PASSWORD FOR '${MYSQL_USERNAME}'@'localhost'=PASSWORD('${MYSQL_PASSWORD}');
GRANT ALL ON *.* TO '${MYSQL_USERNAME}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
