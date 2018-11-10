MYSQL_PASS="$1"

sudo apt -y update
#Apache2
sudo apt -y install apache2
#PHP
sudo apt -y install software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt -y update
sudo apt -y install php7.2
sudo apt -y install php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml
sudo apt -y install php5.6
sudo apt -y install php-pear php5.6-curl php5.6-dev php5.6-gd php5.6-mbstring php5.6-zip php5.6-mysql php5.6-xml

sudo rm /etc/apache2/mods-enabled/dir.conf
sudo echo '<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>' >> /etc/apache2/mods-enabled/dir.conf
sudo service apache2 restart

#Mysql
sudo debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password password $MYSQL_PASS"
sudo debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password_again password $MYSQL_PASS"
sudo apt-get -y install mysql-server-5.7
