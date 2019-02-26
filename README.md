## Linux Ubuntu Easy LAMP Installation and Apache Virtual Host Creation Scripts

### LAMP Install

    cd /home
    wget https://github.com/abdulsametsahin/deployer/raw/master/lamp_install.sh
    chmod +x lamp_install.sh
    ./lamp_install.sh mysql_root_password

### Create Apache Virtual Host
Download the script.

    cd /home
    wget https://github.com/abdulsametsahin/deployer/raw/master/apache_vhost.sh
    chmod +x apache_vhost.sh

Create a virtual host

    cd /home
    ./apache_vhost.sh example.com public

> "public" is the folder name for public files.
> Of course example.com is your domain name. 
