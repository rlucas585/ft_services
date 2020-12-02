-- --------------------------------------------------------
-- SQL Commands to set up the default table for mysql
-- --------------------------------------------------------

--- mysql user
CREATE USER IF NOT EXISTS '${MYSQL_USERNAME}' IDENTIFIED BY '${MYSQL_PASSWORD}';
-- SET PASSWORD FOR '${MYSQL_USERNAME}'@'localhost'=PASSWORD('${MYSQL_PASSWORD}');
GRANT ALL ON *.* TO '${MYSQL_USERNAME}' IDENTIFIED BY '${MYSQL_PASSWORD}';
-- FLUSH PRIVILEGES;

--- wordpress user
CREATE USER IF NOT EXISTS '${WP_USER}' IDENTIFIED BY '${WP_PASS}';
CREATE DATABASE IF NOT EXISTS `${MYSQL_DB}` CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL ON *.* TO '${WP_USER}' IDENTIFIED BY '${WP_PASS}';
-- FLUSH PRIVILEGES;

-- Probably useless
CREATE USER IF NOT EXISTS '${MYSQL_USERNAME}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
-- SET PASSWORD FOR '${MYSQL_USERNAME}'@'localhost'=PASSWORD('${MYSQL_PASSWORD}');
GRANT ALL ON *.* TO '${MYSQL_USERNAME}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
