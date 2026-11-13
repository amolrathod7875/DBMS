use sql_interview_practice;

select * from employees;

SELECT * FROM departments;


SELECT e.employee_name, e.salary
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'AI' AND e.salary > 60000
ORDER BY e.salary DESC;