CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE provinces(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

CREATE TABLE locations(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
province_id INT NOT NULL,
FOREIGN KEY(province_id)REFERENCES provinces(id)
);

CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
last_names VARCHAR(50) NOT NULL,
address VARCHAR(100) NOT NULL,
postal_code VARCHAR(10) NOT NULL,
location_id INT NOT NULL,
telephone VARCHAR(10) NOT NULL,
FOREIGN KEY(location_id)REFERENCES locations(id)
);
INSERT INTO provinces(name) VALUES('Barcelona');
INSERT INTO locations(name, province_id) VALUES('Barcelona', 1);

INSERT INTO customers( name, last_names, address, postal_code, location_id, telephone)
VALUES
('Miguel', 'Calvo Hitcher', 'Carrer Collblanc 23', '08904', 1, '695334567'),
('Sara', 'Rodríguez', 'Carrer Sido 10', '08035', 1, '685665424');

CREATE TABLE orders(
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
date_hour DATETIME NOT NULL,
order_type ENUM('Click and Collect', 'Delivery') NOT NULL,
total_price DECIMAL(8,2) NOT NULL,
FOREIGN KEY(customer_id)REFERENCES customers(id)
);

Create TABLE products(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
description TEXT,
image VARCHAR(255),
price DECIMAL(6,2),
category_id INT,
FOREIGN KEY(category_id)REFERENCES categories(id)
);

CREATE TABLE order_details(
id INT AUTO_INCREMENT,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY(order_id, product_id),
FOREIGN KEY(order_id)REFERENCES orders(id),
FOREIGN KEY(product_id)REFERENCES products(id)
);

CREATE TABLE categories(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
INSERT INTO categories(name) VALUES
('Classics'),
('Specials'),
('Gourmet'),
('Vegans');

CREATE TABLE stores(
id INT AUTO_INCREMENT PRIMARY KEY,
address VARCHAR(50),
postal_code VARCHAR(10),
location_id INT NOT NULL,
FOREIGN KEY(location_id)REFERENCES locations(id)
);

CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
last_names VARCHAR(50) NOT NULL,
DNI VARCHAR(10) NOT NULL,
telephone VARCHAR(10) NOT NULL,
rol ENUM('staff', 'rider'),
store_id INT,
FOREIGN KEY(store_id)REFERENCES stores(id)
);

CREATE TABLE deliveries(
id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT UNIQUE NOT NULL,
rider_id INT NOT NULL,
delivery_time DATETIME NOT NULL,
FOREIGN KEY(order_id)REFERENCES orders(id),
FOREIGN KEY(rider_id)REFERENCES employees(id)
);









