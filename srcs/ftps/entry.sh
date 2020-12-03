adduser -D -h /var/ftp $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

export PASSIVE_ADDR=$(/tmp/get_external_ip_addresses.sh ftps)

envsubst '${PASSIVE_ADDR}' < /tmp/vsftpd.conf > /etc/vsftpd/vsftpd.conf

vsftpd /etc/vsftpd/vsftpd.conf
