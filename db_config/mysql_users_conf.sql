-- CHANGE root password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Djiby_Sarr_1996';

-- NEW USER CREATE
CREATE USER IF NOT EXISTS 'Djiby'@'localhost' IDENTIFIED BY 'Djiby_Sarr_1996';
GRANT ALL PRIVILEGES ON *.* TO 'Djiby'@'localhost';