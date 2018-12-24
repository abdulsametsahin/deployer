DOMAIN="$1"
PUBLIC_FOLDER="$2"

sudo mkdir -p /var/www/$DOMAIN/$PUBLIC_FOLDER
sudo chown -R $USER:$USER /var/www/$DOMAIN
sudo chmod -R 755 /var/www
touch /var/www/$DOMAIN/$PUBLIC_FOLDER/index.html
sudo echo "it works $DOMAIN" >> /var/www/$DOMAIN/$PUBLIC_FOLDER/index.html

sudo echo "<VirtualHost *:80>
    ServerAdmin admin@$DOMAIN
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    DocumentRoot /var/www/$DOMAIN/$PUBLIC_FOLDER
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
    <Directory /var/www/$DOMAIN/$PUBLIC_FOLDER>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
</VirtualHost>" >> /etc/apache2/sites-available/$DOMAIN.conf

sudo a2ensite $DOMAIN.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart
