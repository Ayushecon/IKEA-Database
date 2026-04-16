-- IKEA Database Queries
-- Author: AYUSH SAHA
-- Description: Example queries for data analysis and database testing
-- 1
INSERT INTO PRODUCT (product_id, name, category, price, manufacturer_id)
VALUES ('P00011', 'Study Table', 'Office', 200.29, 'M00010');
-- 2
INSERT INTO CUSTOMER (customer_id, fname, lname, email, address)
VALUES ('C00011', 'Stefano', 'Mannuzzi', 'stefano.m@gmail.com', 'Via Piave 8');
-- 3
INSERT INTO EMPLOYEE (employee_id, fname, lname, email, role, salary, store_id, warehouse_id)
VALUES ('E00011', 'Edoardo', 'Mancini', 'edoardo.mancini@ikea.com', 'Marketing', 3200.00, 'S00010', N-- 4a
INSERT INTO STORE (store_id, location)
VALUES ('S00011', 'Brussels');
-- 4b
INSERT INTO WAREHOUSE (warehouse_id, location, capacity, manager_id)
VALUES ('W00011', 'Brussels WH', 5000, 'E00011');
-- 5
INSERT INTO MANUFACTURER (manufacturer_id, name, location)
VALUES ('M00011', 'IKEA Belgium', 'Belgium');
-- 6
INSERT INTO SALE (sale_id, date, sale_type, customer_id, store_id)
VALUES ('SA0011', '2024-02-08', 'physical', NULL, 'S00011');
-- 7
UPDATE PRODUCT
SET price = 150.99
WHERE product_id = 'P00002';
-- 8
UPDATE PRODUCT_WAREHOUSE
SET quantity = 100
WHERE product_id = 'P00006'
 AND warehouse_id = 'W00006';
-- 9
UPDATE EMPLOYEE
SET store_id = 'S00011',
 warehouse_id = NULL
WHERE employee_id = 'E00011';
-- 10
SELECT p.product_id, p.name, p.category, p.price, pw.quantity
FROM PRODUCT p
JOIN PRODUCT_WAREHOUSE pw
 ON p.product_id = pw.product_id
WHERE pw.warehouse_id = 'W00006';
-- 11
SELECT sale_id, date, sale_type, customer_id, store_id
FROM SALE
WHERE date BETWEEN '2024-01-15' AND '2024-01-29';
-- 12
SELECT s.store_id, SUM(sp.quantity * sp.price) AS total_sales_value
FROM SALE s
JOIN SALE_PRODUCT sp
 ON s.sale_id = sp.sale_id
WHERE s.store_id IS NOT NULL
GROUP BY s.store_id;
-- 13
SELECT p.product_id, p.name, SUM(pw.quantity) AS total_quantity
FROM PRODUCT p
JOIN PRODUCT_WAREHOUSE pw
 ON p.product_id = pw.product_id
GROUP BY p.product_id, p.name;
-- 14
SELECT p.product_id, p.name, SUM(sp.quantity) AS total_sold
FROM PRODUCT p
JOIN SALE_PRODUCT sp
 ON p.product_id = sp.product_id
GROUP BY p.product_id, p.name
ORDER BY total_sold