SHOW DATABASES;

USE sql_interview_practice;

SELECT employee_name, hire_date 
FROM employees
WHERE employment_status = 'active' 
AND 
hire_date BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY hire_date ASC;

