-- IKEA Database Data
-- Sample data insertion for testing the database
-- MANUFACTURER
INSERT INTO MANUFACTURER (manufacturer_id, name, location) VALUES
('M00001', 'IKEA Sweden', 'Sweden'),
('M00002', 'IKEA Italy', 'Italy'),
('M00003', 'IKEA Germany', 'Germany'),
('M00004', 'IKEA France', 'France'),
('M00005', 'IKEA Spain', 'Spain'),
('M00006', 'IKEA USA', 'USA'),
('M00007', 'IKEA Canada', 'Canada'),
('M00008', 'IKEA UK', 'UK'),
('M00009', 'IKEA Japan', 'Japan'),
('M00010', 'IKEA Netherlands', 'Netherlands');
-- STORE
INSERT INTO STORE (store_id, location) VALUES
('S00001', 'Stockholm'),
('S00002', 'Rome'),
('S00003', 'Berlin'),
('S00004', 'Paris'),
('S00005', 'Madrid'),
('S00006', 'New York'),
('S00007', 'Toronto'),
('S00008', 'London'),
('S00009', 'Tokyo'),
('S00010', 'Amsterdam');
-- CUSTOMER
INSERT INTO CUSTOMER (customer_id, fname, lname, email, address) VALUES
('C00001', 'Anna', 'Rossi', 'anna.rossi@gmail.com', 'Via Roma 10'),
('C00002', 'Luca', 'Bianchi', 'luca.bianchi@gmail.com', 'Via Milano 22'),
('C00003', 'Marie', 'Dubois', 'marie.dubois@gmail.com', 'Rue Paris 5'),
('C00004', 'John', 'Smith', 'john.smith@gmail.com', 'New York 12'),
('C00005', 'Emma', 'Brown', 'emma.brown@gmail.com', 'London Street 8'),
('C00006', 'Carlos', 'Garcia', 'carlos.garcia@gmail.com', 'Madrid Ave 3'),
('C00007', 'Sofia', 'Martinez', 'sofia.m@gmail.com', 'Barcelona 14'),
('C00008', 'David', 'Miller', 'david.miller@gmail.com', 'Berlin Road 6'),
('C00009', 'Yuki', 'Tanaka', 'yuki.t@gmail.com', 'Tokyo Central'),
('C00010', 'Noah', 'Wilson', 'noah.w@gmail.com', 'Toronto West');
-- PRODUCT
INSERT INTO PRODUCT (product_id, name, category, price, manufacturer_id) VALUES
('P00001', 'Chair Basic', 'Furniture', 49.99, 'M00001'),
('P00002', 'Table Wood', 'Furniture', 129.99, 'M00002'),
('P00003', 'Desk Office', 'Office', 199.99, 'M00003'),
('P00004', 'Lamp LED', 'Lighting', 29.99, 'M00004'),
('P00005', 'Sofa Comfort', 'Furniture', 399.99, 'M00005'),
('P00006', 'Bed Frame', 'Bedroom', 299.99, 'M00006'),
('P00007', 'Wardrobe Large', 'Storage', 499.99, 'M00007'),
('P00008', 'Bookshelf', 'Storage', 89.99, 'M00008'),
('P00009', 'Dining Set', 'Furniture', 599.99, 'M00009'),
('P00010', 'Office Chair Pro', 'Office', 149.99, 'M00010');
-- EMPLOYEE
INSERT INTO EMPLOYEE (employee_id, fname, lname, email, role, salary, store_id, warehouse_id) VALUE('E00001', 'Alice', 'Johnson', 'alice.johnson@ikea.com', 'Cashier', 1800.00, 'S00001', NULL),
('E00002', 'Brian', 'Smith', 'brian.smith@ikea.com', 'Sales', 1900.00, 'S00002', NULL),
('E00003', 'Clara', 'Miller', 'clara.miller@ikea.com', 'Designer', 2200.00, 'S00003', NULL),
('E00004', 'Daniel', 'Brown', 'daniel.brown@ikea.com', 'Supervisor', 2500.00, 'S00004', NULL),
('E00005', 'Eva', 'Davis', 'eva.davis@ikea.com', 'Assistant', 1700.00, 'S00005', NULL),
('E00006', 'Frank', 'Wilson', 'frank.wilson@ikea.com', 'Manager', 3000.00, 'S00006', NULL),
('E00007', 'Grace', 'Taylor', 'grace.taylor@ikea.com', 'Sales', 1950.00, 'S00007', NULL),
('E00008', 'Henry', 'Anderson', 'henry.anderson@ikea.com', 'Cashier', 1750.00, 'S00008', NULL),
('E00009', 'Isabella', 'Thomas', 'isabella.thomas@ikea.com', 'Supervisor', 2600.00, 'S00009', NULL)('E00010', 'Jack', 'Moore', 'jack.moore@ikea.com', 'Manager', 3100.00, 'S00010', NULL);
-- WAREHOUSE
INSERT INTO WAREHOUSE (warehouse_id, location, capacity, manager_id) VALUES
('W00001', 'Stockholm WH', 5000, 'E00001'),
('W00002', 'Rome WH', 4000, 'E00002'),
('W00003', 'Berlin WH', 4500, 'E00003'),
('W00004', 'Paris WH', 4200, 'E00004'),
('W00005', 'Madrid WH', 3800, 'E00005'),
('W00006', 'New York WH', 6000, 'E00006'),
('W00007', 'Toronto WH', 3500, 'E00007'),
('W00008', 'London WH', 4700, 'E00008'),
('W00009', 'Tokyo WH', 5200, 'E00009'),
('W00010', 'Amsterdam WH', 4300, 'E00010');
-- SALE
INSERT INTO SALE (sale_id, date, sale_type, customer_id, store_id) VALUES
('SA0001', '2024-01-10', 'online', 'C00001', NULL),
('SA0002', '2024-01-12', 'physical', NULL, 'S00002'),
('SA0003', '2024-01-15', 'online', 'C00003', NULL),
('SA0004', '2024-01-18', 'physical', NULL, 'S00004'),
('SA0005', '2024-01-20', 'online', 'C00005', NULL),
('SA0006', '2024-01-22', 'physical', NULL, 'S00006'),
('SA0007', '2024-01-25', 'online', 'C00007', NULL),
('SA0008', '2024-01-27', 'physical', NULL, 'S00008'),
('SA0009', '2024-01-29', 'online', 'C00009', NULL),
('SA0010', '2024-02-01', 'physical', NULL, 'S00010');
-- SALE_PRODUCT
INSERT INTO SALE_PRODUCT (sale_id, product_id, quantity, price) VALUES
('SA0001', 'P00001', 2, 49.99),
('SA0002', 'P00002', 1, 129.99),
('SA0003', 'P00003', 1, 199.99),
('SA0004', 'P00004', 3, 29.99),
('SA0005', 'P00005', 1, 399.99),
('SA0006', 'P00006', 2, 299.99),
('SA0007', 'P00007', 1, 499.99),
('SA0008', 'P00008', 4, 89.99),
('SA0009', 'P00009', 1, 599.99),
('SA0010', 'P00010', 2, 149.99);
-- PRODUCT_WAREHOUSE
INSERT INTO PRODUCT_WAREHOUSE (product_id, warehouse_id, quantity) VALUES
('P00001', 'W00001', 100),
('P00002', 'W00002', 80),
('P00003', 'W00003', 60),
('P00004', 'W00004', 120),
('P00005', 'W00005', 40),
('P00006', 'W00006', 70),
('P00007', 'W00007', 30),
('P00008', 'W00008', 90),
('P00009', 'W00009', 50),
('P00010', 'W00010', 110)