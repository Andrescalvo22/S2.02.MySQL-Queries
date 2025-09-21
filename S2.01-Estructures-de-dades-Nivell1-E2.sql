DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE provinces (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    province_id INT NOT NULL,
    FOREIGN KEY (province_id) REFERENCES provinces (id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    last_names VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    location_id INT NOT NULL,
    telephone VARCHAR(15) NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    date_hour DATETIME NOT NULL,
    order_type ENUM('Click and Collect', 'Delivery') NOT NULL,
    total_price DECIMAL(8 , 2 ) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(6 , 2 ) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE order_details (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE stores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    last_names VARCHAR(50) NOT NULL,
    DNI VARCHAR(12) NOT NULL UNIQUE,
    telephone VARCHAR(15) NOT NULL UNIQUE,
    rol ENUM('staff', 'rider') NOT NULL,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES stores (id)
);

CREATE TABLE deliveries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE NOT NULL,
    rider_id INT NOT NULL,
    delivery_time DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (rider_id) REFERENCES employees (id)
);

-- INSERTS EN ORDEN CORRECTO --

INSERT INTO provinces(name) VALUES('Barcelona');

INSERT INTO locations(name, province_id) VALUES('Barcelona', 1);

INSERT INTO categories(name) VALUES
('Classics'),
('Specials'),
('Gourmet'),
('Vegans');

INSERT INTO products(name, description, image, price, category_id)
VALUES ('Bacon', 'Fresh bacon made in Spain', 
'https://upload.wikimedia.org/wikipedia/commons/3/31/Made20bacon.png', 
120.35, 1);

INSERT INTO customers(name, last_names, address, postal_code, location_id, telephone)
VALUES
('Miguel', 'Calvo Hitcher', 'Carrer Collblanc 23', '08904', 1, '695334567'),
('Sara', 'Rodríguez', 'Carrer Sido 10', '08035', 1, '685665424');

INSERT INTO orders (customer_id, date_hour, order_type, total_price)
VALUES (1, '2025-08-30 14:30:00', 'Click and Collect', 25.99);

INSERT INTO order_details(order_id, product_id, quantity)
VALUES (1, 1, 2);

INSERT INTO stores(address, postal_code, location_id)
VALUES ('Carrer Muntaner 125', '08036', 1);

INSERT INTO employees(name, last_names, DNI, telephone, rol, store_id)
VALUES ('Oriol', 'Paz Gutierrez', '9305617P', '685665434', 'rider', 1),
('Judith', 'Martinez Gas', '7137604L', '665789345', 'staff', 1);

INSERT INTO deliveries(order_id, rider_id, delivery_time)
VALUES(1, 1, '2025-09-02 15:35:00');





