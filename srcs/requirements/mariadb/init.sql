-- Set root password
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';

-- Create database
CREATE DATABASE wordpress_db;

-- Create user and grant privileges
CREATE USER 'my_user'@'%' IDENTIFIED BY 'my_password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'my_user'@'%';