export EXTERNAL_IP=$(/tmp/get_external_ip_addresses.sh nginx)

envsubst '${EXTERNAL_IP}' < /tmp/server.conf > /etc/nginx/conf.d/default.conf 
envsubst '${EXTERNAL_IP}' < /tmp/index.html > /var/www/html/index.html

/usr/bin/supervisord -c /etc/supervisord.conf
