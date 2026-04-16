-- IKEA Database Schema
-- Author: AYUSH SAHA
-- Description: DDL for IKEA relational database

CREATE DATABASE IKEA;
CREATE DOMAIN ID_CODE AS CHAR(6) NOT NULL;
CREATE TABLE MANUFACTURER (
 manufacturer_id ID_CODE,
 name VARCHAR(15) NOT NULL,
 location VARCHAR(15) NOT NULL,
 PRIMARY KEY (manufacturer_id)
);
CREATE TABLE STORE (
 store_id ID_CODE,
 location VARCHAR(15) NOT NULL,
 PRIMARY KEY (store_id)
);
CREATE TABLE CUSTOMER (
 customer_id ID_CODE,
 fname VARCHAR(15) NOT NULL,
 lname VARCHAR(15) NOT NULL,
 email VARCHAR(50) NOT NULL,
 address VARCHAR(30) NOT NULL,
 PRIMARY KEY (customer_id),
 UNIQUE (email)
);
CREATE TABLE PRODUCT (
 product_id ID_CODE,
 name VARCHAR(40) NOT NULL,
 category VARCHAR(40) NOT NULL,
 price DECIMAL(5,2) NOT NULL DEFAULT 0.99 CHECK (price > 0),
 manufacturer_id ID_CODE,
 PRIMARY KEY (product_id),
 FOREIGN KEY (manufacturer_id)
 REFERENCES MANUFACTURER(manufacturer_id)
 ON DELETE SET NULL
);
CREATE TABLE EMPLOYEE (
 employee_id ID_CODE,
 fname VARCHAR(15) NOT NULL,
 lname VARCHAR(15) NOT NULL,
 email VARCHAR(50) NOT NULL,
 role VARCHAR(15) NOT NULL,
 salary DECIMAL(10,2) NOT NULL DEFAULT 1000 CHECK (salary > 0),
 store_id ID_CODE,
 warehouse_id ID_CODE,
 PRIMARY KEY (employee_id),
 UNIQUE (email),
 FOREIGN KEY (store_id)
 REFERENCES STORE(store_id)
 ON DELETE SET NULL
);
CREATE TABLE WAREHOUSE (
 warehouse_id ID_CODE,
 location VARCHAR(15) NOT NULL,
 capacity INT NOT NULL CHECK (capacity > 0),
 manager_id ID_CODE,
 PRIMARY KEY (warehouse_id),
 FOREIGN KEY (manager_id)
 REFERENCES EMPLOYEE(employee_id)
 ON DELETE SET NULL
);
CREATE TABLE SALE (
 sale_id ID_CODE,
 date DATE NOT NULL,
 sale_type CHAR(8) NOT NULL CHECK (sale_type IN ('physical', 'online')),
 customer_id ID_CODE,
 store_id ID_CODE,
 PRIMARY KEY (sale_id),
 FOREIGN KEY (customer_id)
 REFERENCES CUSTOMER(customer_id)
 ON DELETE SET NULL,
 FOREIGN KEY (store_id)
 REFERENCES STORE(store_id)
 ON DELETE SET NULL
);
CREATE TABLE SALE_PRODUCT (
 sale_id ID_CODE,
 product_id ID_CODE,
 quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
 price DECIMAL(5,2) NOT NULL CHECK (price > 0),
 PRIMARY KEY (sale_id, product_id),
 FOREIGN KEY (sale_id)
 REFERENCES SALE(sale_id)
 ON DELETE CASCADE,
 FOREIGN KEY (product_id)
 REFERENCES PRODUCT(product_id)
 ON DELETE CASCADE
);
CREATE TABLE PRODUCT_WAREHOUSE (
 product_id ID_CODE,
 warehouse_id ID_CODE,
 quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
 PRIMARY KEY (product_id, warehouse_id),
 FOREIGN KEY (product_id)
 REFERENCES PRODUCT(product_id)
 ON DELETE CASCADE,
 FOREIGN KEY (warehouse_id)
 REFERENCES WAREHOUSE(warehouse_id)
 ON DELETE CASCADE
);
ALTER TABLE EMPLOYEE
ADD CONSTRAINT fk_employee_warehouse
FOREIGN KEY (warehouse_id)
REFERENCES WAREHOUSE(warehouse_id)
ON DELETE SET NULL;