SHOW DATABASES ;

USE sql_interview_practice;

SHOW TABLES;

SHOW COLUMNS FROM products;

SELECT product_name, category, price 
FROM products
where product_name LIKE "M%"
ORDER BY product_name DESC;