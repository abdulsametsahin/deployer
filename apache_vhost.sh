HOST="$1"
PUBLIC_FOLDER="$2"

sudo mkdir -p /var/www/$HOST/public_html
sudo chown -R $USER:$USER /var/www/$HOST/public_html
sudo chmod -R 755 /var/www
sudo echo "it works" >> /var/www/$HOST/public_html/index.html
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$HOST.conf

sudo echo '<VirtualHost *:80>
    ServerAdmin admin@$HOST
    ServerName $HOST
    ServerAlias www.$HOST
    DocumentRoot /var/www/$HOST/$PUBLIC_FOLDER
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' >> /etc/apache2/sites-available/$HOST.conf

sudo a2ensite $HOST.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart
