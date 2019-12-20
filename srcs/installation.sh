#update and upgrade
apt-get update
apt-get -y upgrade

#install
apt-get -y install mariadb-server
apt-get -y install wget
apt-get -y install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
apt-get -y install php-mysql
apt-get -y install nginx


#services management
mkdir ~/mkcert
cd ~/mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
mv mkcert-v1.1.2-linux-amd64 mkcert
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd
cd ..
ln -s /etc/nginx/sites-available/wordpress.conf  /etc/nginx/sites-enabled/
service mysql start
mysql -u root < /home/database
mysql wordpress -u root --password= < /home/wordpress.sql
mv /home/wordpress.tar.gz /var/www/html/.
cd /var/www/html
tar -xf wordpress.tar.gz
rm wordpress.tar.gz
cd
cd ..
mkdir /var/www/html/wordpress/index
mv /home/index.html /var/www/html/wordpress/index/.
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*