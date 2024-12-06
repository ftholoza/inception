#!/bin/bash

# Start MariaDB in the background to allow for configuration
service mariadb start

mysqladmin -u root password "$SQL_ROOT_PASSWORD"
# Wait for MariaDB to start properly
sleep 5

# Ensure the MariaDB server is running by checking for the socket file
if [ ! -e /run/mysqld/mysqld.sock ]; then
    echo "MariaDB is not running. Exiting..."
    exit 1
fi

# Create the database and user if they don't exist
echo "Setting up database and user..."

mysql -u root -p"$SQL_ROOT_PASSWORD" <<-EOF

CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Output success message
echo "MySQL setup complete. User '$SQL_USER' has been created."

# Stop MariaDB to start it in the foreground
service mariadb stop

# Start MariaDB in the foreground to keep the container running
exec mysqld_safe --datadir=/var/lib/mysql --bind-address=0.0.0.0
