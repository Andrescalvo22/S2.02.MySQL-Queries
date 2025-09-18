DROP DATABASE IF EXISTS opticaculldampolla;
CREATE DATABASE opticaculldampolla;
USE opticaculldampolla;

DROP TABLE IF EXISTS sales, employees, clients, glasses,suppliers;

CREATE TABLE IF NOT EXISTS suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    street VARCHAR(100),
    number VARCHAR(10),
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(50),
    postalcode VARCHAR(10),
    country VARCHAR(50),
    telephone VARCHAR(10),
    fax VARCHAR(20),
    NIF VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS glasses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50),
    glass_graduation VARCHAR(50),
    type_of_mount ENUM('Floating', 'paste', 'mechanic'),
    color_mount VARCHAR(50),
    glass_color VARCHAR(50),
    price DECIMAL(10 , 2 ),
    ID_supplier INT,
    FOREIGN KEY (ID_supplier)
        REFERENCES suppliers (id)
);

CREATE TABLE IF NOT EXISTS clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(200),
    telephone VARCHAR(10),
    email VARCHAR(50),
    date_register DATE,
    ID_recomendation_client INT,
    FOREIGN KEY (ID_recomendation_client)
        REFERENCES clients (id)
);

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    id_employee INT,
    id_glass INT,
    date_sale DATE,
    FOREIGN KEY (id_client)
        REFERENCES clients (id),
    FOREIGN KEY (id_employee)
        REFERENCES employees (id),
    FOREIGN KEY (id_glass)
        REFERENCES glasses (id)
);

INSERT INTO suppliers (name, street, number, city, country, telephone, NIF)
VALUES
('OptiPro', 'Carrer Major', '12', 'Barcelona', 'Spain', '923456789', 'B13467546'),
('VisionCo', 'Rambla Nova', '45', 'Barcelona', 'Spain', '977124568', 'B87654321');

INSERT INTO glasses (brand, glass_graduation, type_of_mount, color_mount, glass_color, price, ID_supplier)
VALUES
('Ray-Ban', '-2.5', 'paste', 'black', 'blue', '120.0', 1),
('Oakley', '-1.0', 'mechanic', 'grey', 'yellow', '150.0', 2);

INSERT INTO clients (name, address, telephone, email, date_register)
VALUES
('Andres Calvo', 'Carrer LLacuna 35, Barcelona', '685665424', 'andrescalvo01@gmail.com', '2025-09-09'),
('Luis Rodríguez', 'Carrer Lledoner 12, Barcelona', '626181613', 'luisrodriguez2@gmail.com', '2025-09-09');

INSERT INTO employees(name)
VALUES
('Abril Fernández'),
('Maria Bonillo');


INSERT INTO sales(id_client, id_employee, id_glass, date_sale)
VALUES
(1,1,1, '2025-09-09'),
(2,2,2, '2025-09-09');




 





