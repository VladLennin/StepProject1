#!/bin/bash

#################################   MySql   #######################################

MYSQL_ROOT_PASSWORD="12345678"

# Install MySQL Server
sudo apt update
sudo apt install -y mysql-server

# Start MySQL service
sudo systemctl start mysql.service

# Run MySQL commands to set the password
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
exit
EOF

# Set root password and run secure installation
echo "Y" | sudo mysql_secure_installation <<EOF
$MYSQL_ROOT_PASSWORD
2
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
EOF

# Check MySQL service status
sudo systemctl status mysql.service

###################################   MySql Exporter   ########################################

#Add Prometheus system user and group
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus

#Download and install Prometheus MySQL Exporter
curl -s https://api.github.com/repos/prometheus/mysqld_exporter/releases/latest   | grep browser_download_url   | grep linux-amd64 | cut -d '"' -f 4   | wget -qi -
tar xvf mysqld_exporter*.tar.gz
sudo mv  mysqld_exporter-*.linux-amd64/mysqld_exporter /usr/local/bin/
sudo chmod +x /usr/local/bin/mysqld_exporter
mysql -u root -p12345678 <<EOF
CREATE USER 'mysqld_exporter'@'localhost' IDENTIFIED BY '12345678';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'mysqld_exporter'@'localhost';
FLUSH PRIVILEGES;
EXIT
EOF

#Configure database credentials
sudo echo "[client]
user=mysqld_exporter
password=12345678" >> /etc/.mysqld_exporter.cnf
sudo chown root:prometheus /etc/.mysqld_exporter.cnf

#Create systemd unit file ( For Systemd systems )
sudo mv /tmp/mysql_exporter.service /etc/systemd/system/

#When done, reload systemd and start mysql_exporter service
sudo systemctl daemon-reload
sudo systemctl enable mysql_exporter
sudo systemctl start mysql_exporter

####################################   Node Exporter   #######################################

#Node Exporter installation
cd ~/
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xvfz node_exporter-*.tar.gz
sudo mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin
rm -r node_exporter-1.5.0.linux-amd64*
sudo mv /tmp/node_exporter.service /etc/systemd/system/node_exporter.service
sudo useradd -rs /bin/false node_exporter
sudo systemctl enable node_exporter
sudo systemctl daemon-reload
sudo systemctl start node_exporter

