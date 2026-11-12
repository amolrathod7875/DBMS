-- SQL Interview Practice | Synthetic data only | MySQL 8.0+
-- WARNING: Running this script resets tables of the same names inside sql_interview_practice.
-- Never run against production or a database containing important data.
CREATE DATABASE IF NOT EXISTS sql_interview_practice CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE sql_interview_practice;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS support_tickets;
DROP TABLE IF EXISTS model_runs;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(60) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(80) NOT NULL,
  department_id INT NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  hire_date DATE NOT NULL,
  manager_id INT NULL,
  employment_status ENUM('active','inactive') NOT NULL DEFAULT 'active',
  CONSTRAINT fk_employee_dept FOREIGN KEY (department_id) REFERENCES departments(department_id),
  CONSTRAINT fk_employee_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
  CONSTRAINT chk_employee_salary CHECK (salary >= 0)
) ENGINE=InnoDB;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(80) NOT NULL,
  city VARCHAR(60) NOT NULL,
  signup_date DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(80) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  CONSTRAINT chk_product_price CHECK (price >= 0),
  CONSTRAINT chk_product_stock CHECK (stock >= 0)
) ENGINE=InnoDB;

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  order_status ENUM('delivered','pending','cancelled') NOT NULL,
  CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB;

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_item_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_item_product FOREIGN KEY (product_id) REFERENCES products(product_id),
  CONSTRAINT chk_item_quantity CHECK (quantity > 0),
  CONSTRAINT chk_item_price CHECK (unit_price >= 0)
) ENGINE=InnoDB;

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  paid_at DATE NOT NULL,
  payment_method ENUM('card','upi','cash') NOT NULL,
  payment_status ENUM('paid','pending','failed') NOT NULL,
  CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT chk_payment_amount CHECK (amount >= 0)
) ENGINE=InnoDB;

CREATE TABLE support_tickets (
  ticket_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  assigned_employee_id INT NULL,
  priority ENUM('low','medium','high') NOT NULL,
  ticket_status ENUM('open','pending','resolved') NOT NULL,
  created_at DATE NOT NULL,
  resolved_at DATE NULL,
  CONSTRAINT fk_ticket_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_ticket_employee FOREIGN KEY (assigned_employee_id) REFERENCES employees(employee_id)
) ENGINE=InnoDB;

CREATE TABLE model_runs (
  run_id INT PRIMARY KEY,
  model_name VARCHAR(80) NOT NULL,
  dataset_name VARCHAR(80) NOT NULL,
  accuracy DECIMAL(5,4) NOT NULL,
  started_at DATE NOT NULL,
  deployment_stage ENUM('staging','production','archived') NOT NULL,
  CONSTRAINT chk_accuracy CHECK (accuracy >= 0 AND accuracy <= 1)
) ENGINE=InnoDB;

INSERT INTO departments VALUES
(1,'AI'),(2,'Engineering'),(3,'Sales'),(4,'HR'),(5,'Finance');

-- Management rows inserted before their direct reports to satisfy the self-referencing FK.
INSERT INTO employees VALUES
(105,'Neha',1,120000,'2022-02-01',NULL,'active'),
(106,'Vikram',2,105000,'2021-10-04',NULL,'active'),
(108,'Kavya',3,68000,'2024-12-01',NULL,'active'),
(111,'Dev',5,81000,'2023-11-02',NULL,'active'),
(104,'Sneha',4,40000,'2025-07-12',NULL,'active'),
(101,'Amol',1,75000,'2025-01-15',105,'active'),
(102,'Rahul',2,45000,'2024-06-10',106,'active'),
(103,'Priya',1,90000,'2023-03-21',105,'active'),
(107,'Rohan',1,55000,'2026-04-05',103,'active'),
(109,'Arjun',3,52000,'2025-05-14',108,'inactive'),
(110,'Isha',2,72000,'2026-01-20',106,'active'),
(112,'Meera',2,72000,'2025-09-09',106,'active');

INSERT INTO customers VALUES
(201,'Alice','Pune','2025-01-02'),
(202,'Bob','Mumbai','2025-03-10'),
(203,'Chitra','Pune','2025-05-12'),
(204,'Danish','Delhi','2026-01-14'),
(205,'Esha','Bengaluru','2026-02-01'),
(206,'Farhan','Pune','2026-04-15'),
(207,'Gia','Hyderabad','2026-08-21'),
(208,'Harsh','Mumbai','2026-10-01');

INSERT INTO products VALUES
(301,'Laptop','Electronics',65000,10),
(302,'Mouse','Electronics',800,50),
(303,'Keyboard','Electronics',1600,30),
(304,'Monitor','Electronics',15000,12),
(305,'Notebook','Stationery',120,100),
(306,'Pen','Stationery',30,200),
(307,'Headset','Electronics',2400,0),
(308,'Desk','Furniture',8500,4),
(309,'Chair','Furniture',5500,6),
(310,'Webcam','Electronics',3200,20),
(311,'USB-C Hub','Electronics',1800,15);

INSERT INTO orders VALUES
(401,201,'2026-10-01','delivered'),
(402,202,'2026-10-02','delivered'),
(403,201,'2026-10-05','pending'),
(404,203,'2026-10-07','delivered'),
(405,204,'2026-10-09','cancelled'),
(406,205,'2026-10-10','delivered'),
(407,206,'2026-10-11','pending'),
(408,202,'2026-10-12','delivered'),
(409,208,'2026-10-13','delivered'),
(410,203,'2026-10-15','delivered'),
(411,205,'2026-10-18','delivered'),
(412,201,'2026-10-22','delivered'),
(413,203,'2026-09-04','delivered'),
(414,202,'2026-09-15','delivered'),
(415,201,'2026-11-02','delivered');

INSERT INTO order_items VALUES
(1001,401,301,1,65000),(1002,401,302,2,800),
(1003,402,303,1,1600),(1004,402,304,1,15000),
(1005,403,305,5,120),(1006,403,306,10,30),
(1007,404,309,2,5500),
(1008,405,308,1,8500),
(1009,406,301,1,65000),(1010,406,307,1,2400),
(1011,407,302,1,800),(1012,407,310,1,3200),
(1013,408,302,3,800),
(1014,409,304,2,15000),(1015,409,303,2,1600),
(1016,410,306,20,30),(1017,410,305,5,120),
(1018,411,309,1,5500),(1019,411,308,1,8500),
(1020,412,310,1,3200),(1021,412,303,1,1600),
(1022,413,305,10,120),
(1023,414,308,1,8500),(1024,414,302,1,800),
(1025,415,310,1,3200),(1026,415,302,1,800);

INSERT INTO payments VALUES
(501,401,66600,'2026-10-01','card','paid'),
(502,402,16600,'2026-10-02','upi','paid'),
(503,404,11000,'2026-10-07','card','paid'),
(504,406,67400,'2026-10-10','card','paid'),
(505,408,2400,'2026-10-12','upi','paid'),
(506,409,33200,'2026-10-13','card','paid'),
(507,410,1200,'2026-10-15','cash','paid'),
(508,411,14000,'2026-10-18','card','paid'),
(509,412,4800,'2026-10-22','upi','paid'),
(510,405,8500,'2026-10-10','card','failed'),
(511,403,900,'2026-10-05','upi','pending'),
(512,413,1200,'2026-09-04','cash','paid'),
(513,414,9300,'2026-09-15','upi','paid'),
(514,415,4000,'2026-11-02','card','paid');

INSERT INTO support_tickets VALUES
(601,201,101,'high','resolved','2026-10-01','2026-10-02'),
(602,202,102,'low','open','2026-10-02',NULL),
(603,203,101,'high','resolved','2026-10-05','2026-10-09'),
(604,204,110,'medium','pending','2026-10-06',NULL),
(605,205,102,'high','resolved','2026-10-10','2026-10-11'),
(606,206,NULL,'low','open','2026-10-15',NULL),
(607,202,101,'medium','resolved','2026-10-18','2026-10-20'),
(608,208,110,'high','open','2026-10-20',NULL),
(609,201,NULL,'low','open','2026-10-21',NULL);

INSERT INTO model_runs VALUES
(701,'fraud_v1','fraud_ds',0.8800,'2026-09-01','production'),
(702,'fraud_v2','fraud_ds',0.9200,'2026-09-05','staging'),
(703,'fraud_v3','fraud_ds',0.9100,'2026-09-10','production'),
(704,'sentiment_v1','reviews',0.8400,'2026-09-12','production'),
(705,'sentiment_v2','reviews',0.8900,'2026-09-20','staging'),
(706,'risk_v1','credit',0.8000,'2026-09-22','archived'),
(707,'risk_v2','credit',0.8700,'2026-10-01','production'),
(708,'sentiment_v3','reviews',0.9000,'2026-10-07','production'),
(709,'risk_v3','credit',0.8700,'2026-10-11','staging');

-- Basic sanity query (safe to execute):
SELECT 'employees' AS table_name, COUNT(*) AS row_count FROM employees
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'payments', COUNT(*) FROM payments
UNION ALL SELECT 'support_tickets', COUNT(*) FROM support_tickets
UNION ALL SELECT 'model_runs', COUNT(*) FROM model_runs;
