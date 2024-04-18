CREATE TABLE employees (
    id_employee SMALLINT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    id_employee_position SMALLINT NOT NULL,
    email VARCHAR(50),
    phone_number VARCHAR(9) NOT NULL,
    id_address INT NOT NULL
);

CREATE TABLE employees_positions (
    id_employee_position SMALLINT IDENTITY(1,1) PRIMARY KEY,
    position VARCHAR(30) NOT NULL,
);

CREATE TABLE contracts_employees (
    id_employee SMALLINT IDENTITY(1,1) PRIMARY KEY,
    Annual_Salary numeric(7,2) DEFAULT 7000,
    hire_date DATE NOT NULL,
    end_date DATE
);

CREATE TABLE adresses (
    id_address INT IDENTITY(1,1) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    number_house VARCHAR(7) NOT NULL,
    number_local VARCHAR(7) NOT NULL,
    postal_code VARCHAR(6) NOT NULL
);

CREATE TABLE products (
    id_product INT IDENTITY(1,1) PRIMARY KEY,
    name_product VARCHAR(30) NOT NULL,
    Size VARCHAR(30),
    id_brand SMALLINT NOT NULL,
    price NUMERIC(7, 2) NOT NULL,
    unit_price NUMERIC(7, 2) NOT NULL,
    quantity INT NOT NULL,
    id_category SMALLINT NOT NULL
);

CREATE TABLE brands (
    id_brand SMALLINT IDENTITY(1,1) PRIMARY KEY,
    brand VARCHAR(30) NOT NULL
);

CREATE TABLE categories (
    id_category SMALLINT IDENTITY(1,1) PRIMARY KEY,
    category VARCHAR(30) NOT NULL,
    id_vat SMALLINT NOT NULL
);

CREATE TABLE taxes (
    id_vat SMALLINT IDENTITY(1,1) PRIMARY KEY,
    vat NUMERIC(4, 2) NOT NULL
);

CREATE TABLE suppliers (
    id_supplier SMALLINT IDENTITY(1,1) PRIMARY KEY,
    supplier_name VARCHAR(50) NOT NULL UNIQUE,
    contact_person VARCHAR(50) NOT NULL,
    phone_number VARCHAR(9) NOT NULL UNIQUE,
    email_address VARCHAR(50) NOT NULL UNIQUE,
    id_address INT
);


CREATE TABLE supplies (
    id_supply INT IDENTITY(1,1) PRIMARY KEY,
    id_supplier SMALLINT NOT NULL,
    unit_price NUMERIC(7, 2) NOT NULL,
    Total_Price NUMERIC(10, 2) NOT NULL,
    supply_date DATE NOT NULL,
    id_delivery_status SMALLINT NOT NULL
);

CREATE TABLE types_delivery_status (
    id_delivery_status SMALLINT IDENTITY(1,1) PRIMARY KEY,
    type_delivery_status VARCHAR(50) NOT NULL
);

CREATE TABLE supplies_details (
    id_supply INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id_supply, id_product)
);

CREATE TABLE orders_stationary_shops (
    id_order INT IDENTITY(1,1) PRIMARY KEY,
    number_customer_card INT,
    Date DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    id_payment_method SMALLINT NOT NULL,
    total_price NUMERIC(7, 2) NOT NULL,
    confirm VARCHAR(3) NOT NULL CHECK (confirm IN ('YES', 'NO'))
);

CREATE TABLE payment_methods (
    id_payment_method SMALLINT IDENTITY(1,1) PRIMARY KEY,
    payment_method VARCHAR(50)
);

CREATE TABLE orders_details (
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    quantity SMALLINT NOT NULL,
    PRIMARY KEY (id_order, id_product)
);

CREATE TABLE users (
    id_user INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    phone_numer VARCHAR(9) NOT NULL,
    email VARCHAR(50) NOT NULL,
    id_address INT NOT NULL,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL
);

CREATE TABLE user_card (
    number_user_card INT IDENTITY(1,1) PRIMARY KEY,
    id_user INT NOT NULL
);

CREATE TABLE online_carts (
    id_online_cart INT IDENTITY(1,1) PRIMARY KEY,
    id_user INT NOT NULL,
    date_added DATETIME2 DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE elements_carts (
    id_online_cart INT NOT NULL,
    id_product INT NOT NULL,
    quantity SMALLINT NOT NULL,
    PRIMARY KEY (id_online_cart, id_product)
);

CREATE TABLE orders_online_shops (
    id_order_online INT NOT NULL PRIMARY KEY,
    total_price NUMERIC(7, 2) NOT NULL,
    date_order DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    number_user_card INT,
    id_order_status SMALLINT NOT NULL,
    id_payment INT NOT NULL
);

CREATE TABLE orders_status (
    id_order_status SMALLINT IDENTITY(1,1) PRIMARY KEY,
    order_status VARCHAR(50) NOT NULL
);

CREATE TABLE online_payments (
    id_payment INT IDENTITY(1,1) PRIMARY KEY,
    id_payment_method SMALLINT NOT NULL,
    payment_amount NUMERIC(7, 2) NOT NULL,
    date_payment DATETIME2 DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE employees
ADD CONSTRAINT fk_employee_position
FOREIGN KEY (id_employee_position) 
REFERENCES employees_positions (id_employee_position);

ALTER TABLE employees
ADD CONSTRAINT fk_address_employee
FOREIGN KEY (id_address) 
REFERENCES adresses (id_address);

ALTER TABLE products
ADD CONSTRAINT fk_brand
FOREIGN KEY (id_brand) 
REFERENCES brands (id_brand);

ALTER TABLE products
ADD CONSTRAINT fk_category
FOREIGN KEY (id_category) 
REFERENCES categories (id_category);

ALTER TABLE categories
ADD CONSTRAINT fk_vat
FOREIGN KEY (id_vat) 
REFERENCES taxes (id_vat);

ALTER TABLE suppliers
ADD CONSTRAINT fk_address_supplier
FOREIGN KEY (id_address) 
REFERENCES adresses (id_address);

ALTER TABLE supplies
ADD CONSTRAINT fk_supplier
FOREIGN KEY (id_supplier) 
REFERENCES suppliers (id_supplier);

ALTER TABLE supplies
ADD CONSTRAINT fk_delivery_status
FOREIGN KEY (id_delivery_status) 
REFERENCES types_delivery_status (id_delivery_status);

ALTER TABLE supplies_details
ADD CONSTRAINT fk_supply
FOREIGN KEY (id_supply) 
REFERENCES supplies (id_supply);

ALTER TABLE supplies_details
ADD CONSTRAINT fk_product
FOREIGN KEY (id_product) 
REFERENCES products (id_product);

ALTER TABLE orders_stationary_shops
ADD CONSTRAINT fk_user_card
FOREIGN KEY (number_customer_card) 
REFERENCES user_card (number_user_card);

ALTER TABLE orders_details
ADD CONSTRAINT fk_order_stationary_shops
FOREIGN KEY (id_order) 
REFERENCES orders_stationary_shops (id_order);

ALTER TABLE orders_details
ADD CONSTRAINT fk_product_orders_details
FOREIGN KEY (id_product) 
REFERENCES products (id_product);

ALTER TABLE users
ADD CONSTRAINT fk_address_users
FOREIGN KEY (id_address) 
REFERENCES adresses (id_address);

ALTER TABLE user_card
ADD CONSTRAINT fk_user
FOREIGN KEY (id_user) 
REFERENCES users (id_user);

ALTER TABLE online_carts
ADD CONSTRAINT fk_user_online_carts
FOREIGN KEY (id_user) 
REFERENCES users (id_user);

ALTER TABLE elements_carts
ADD CONSTRAINT fk_online_carts_elements_carts
FOREIGN KEY (id_online_cart) 
REFERENCES online_carts (id_online_cart);

ALTER TABLE elements_carts
ADD CONSTRAINT fk_product_elements_carts
FOREIGN KEY (id_product) 
REFERENCES products (id_product);

ALTER TABLE orders_online_shops
ADD CONSTRAINT fk_online_cart_orders_online_shops
FOREIGN KEY (id_order_online) 
REFERENCES online_carts (id_online_cart);

ALTER TABLE orders_online_shops
ADD CONSTRAINT fk_payment_orders_online_shops
FOREIGN KEY (id_payment) 
REFERENCES online_payments (id_payment);

ALTER TABLE orders_online_shops
ADD CONSTRAINT fk_status_orders_online_shops
FOREIGN KEY (id_order_status) 
REFERENCES orders_status (id_order_status);

ALTER TABLE orders_online_shops
ADD CONSTRAINT fk_number_customer_card_orders_online
FOREIGN KEY (number_user_card) 
REFERENCES user_card (number_user_card);

ALTER TABLE online_payments
ADD CONSTRAINT fk_payment_method_online_payments
FOREIGN KEY (id_payment_method) 
REFERENCES payment_methods (id_payment_method);

ALTER TABLE orders_stationary_shops
ADD CONSTRAINT fk_payment_method_stationary_payments
FOREIGN KEY (id_payment_method) 
REFERENCES payment_methods (id_payment_method);

ALTER TABLE contracts_employees
ADD CONSTRAINT fk_contracts_employees
FOREIGN KEY (id_employee) 
REFERENCES employees (id_employee);
