HOST="$1"
PUBLIC_FOLDER="$2"

sudo mkdir -p /var/www/$HOST/$PUBLIC_FOLDER
sudo chown -R $USER:$USER /var/www/$HOST
sudo chmod -R 755 /var/www
touch /var/www/$HOST/$PUBLIC_FOLDER/index.html
sudo echo "it works" >> /var/www/$HOST/$PUBLIC_FOLDER/index.html

sudo echo "<VirtualHost *:80>
    ServerAdmin admin@$HOST
    ServerName $HOST
    ServerAlias www.$HOST
    DocumentRoot /var/www/$HOST/$PUBLIC_FOLDER
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" >> /etc/apache2/sites-available/$HOST.conf

sudo a2ensite $HOST.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart
