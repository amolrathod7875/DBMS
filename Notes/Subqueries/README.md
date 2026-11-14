# Phase 3: SQL for Data Science — Topic 12: Subqueries in SQL

Today, let's understand one of the most important SQL concepts: Subqueries. Subqueries are frequently used in SQL interviews and real-world data analysis. They help us solve complex problems by writing one query inside another query.

## 1. What is a Subquery?

A Subquery is a SQL query written inside another SQL query. It is also called an inner query or nested query. The outer query uses the result returned by the inner query.

**Example:** Find employees earning more than the average salary.

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

Let's understand this step by step:
- The inner query calculates the average salary.
- The outer query retrieves employees whose salaries are greater than that average.

This is the basic idea behind subqueries.

## 2. Basic Syntax of a Subquery

```sql
SELECT column_name
FROM table_name
WHERE column_name operator (
    SELECT column_name
    FROM another_table
    WHERE condition
);
```

A subquery is generally enclosed within parentheses. It can be used in different parts of a SQL statement, depending on the query.

## 3. Types of Subqueries

### 1. Single-Row Subquery

Returns only one row.

Example: Find employees earning more than 70,000.

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT 70000
);
```

Another common example uses an aggregate:

### 2. Multiple-Row Subquery

Returns multiple rows.

Example: Find employees working in departments located in Mumbai.

```sql
SELECT employee_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Mumbai'
);
```

Here, the inner query may return multiple department IDs.

### 3. Multiple-Column Subquery

Returns more than one column.

```sql
SELECT *
FROM employees
WHERE (department_id, job_role) IN (
    SELECT department_id, job_role
    FROM approved_positions
);
```

This compares combinations of department ID and job role.

> **Note:** Row-value comparison syntax is supported by several databases, including PostgreSQL and MySQL. Syntax varies across database systems.

## 4. Subquery Using IN

`IN` checks whether a value matches any value returned by the subquery.

Example: Find employees belonging to the IT or HR departments.

```sql
SELECT employee_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'HR')
);
```

Use `IN` when the inner query can return multiple values.

## 5. Subquery Using NOT IN

`NOT IN` returns records whose values do not match the values returned by the inner query.

Example: Find employees who are not assigned to departments listed in the departments table.

```sql
SELECT employee_name, department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM inactive_departments
);
```

> **Important:** Be careful when the subquery returns NULL. A NULL inside a `NOT IN` result can cause the condition to evaluate as unknown and return no matching rows. `NOT EXISTS` is often a safer alternative.

## 6. Subquery Using EXISTS

`EXISTS` checks whether the subquery returns at least one row.

Example: Find customers who have placed at least one order.

```sql
SELECT customer_id, customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

If a matching order exists, the customer is included.

> **Remember:** EXISTS checks whether a matching row exists. It does not need to return actual column values.

## 7. Subquery Using NOT EXISTS

`NOT EXISTS` checks whether the subquery returns no matching rows.

Example: Find customers who have never placed an order.

```sql
SELECT customer_id, customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

This is a common technique for finding missing relationships between tables.

## 8. Subquery in SELECT

You can also use a subquery inside the SELECT statement.

Example: Display each employee's salary along with the company's average salary.

```sql
SELECT
    employee_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS average_salary
FROM employees;
```

The average salary is calculated by the inner query and displayed alongside each employee.

## 9. Subquery in FROM

A subquery can also be used inside the FROM clause. This is commonly called a derived table.

Example: Find departments where the average salary is greater than 70,000.

```sql
SELECT department, average_salary
FROM (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
) AS department_summary
WHERE average_salary > 70000;
```

Here:
- The inner query calculates the average salary by department.
- The outer query filters departments based on that result.

## 10. What is a Correlated Subquery?

A Correlated Subquery is a subquery that depends on values from the outer query. Unlike a regular subquery, it references a column from the outer query.

Example: Find employees earning more than the average salary of their own department.

```sql
SELECT e.employee_name,
       e.department,
       e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);
```

How does it work?
- The outer query selects an employee.
- The inner query calculates the average salary for that employee's department.
- The outer query checks whether the employee earns more than that average.

This comparison is performed for each outer employee row conceptually.

## 11. Subquery vs JOIN

Both Subqueries and JOINs can solve similar problems, but their approaches are different.

| Subquery | JOIN |
|---|---|
| Query inside another query | Combines tables |
| Uses results from an inner query | Uses matching conditions |
| Useful for existence checks and comparisons | Useful for retrieving related columns |
| Can be nested | Can combine multiple tables |

Example using a Subquery:

```sql
SELECT employee_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Mumbai'
);
```

Equivalent approach using JOIN:

```sql
SELECT e.employee_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.location = 'Mumbai';
```

Both can return the same employee names, assuming the department matching logic is equivalent.

> **Important:** Neither approach is always faster. Performance depends on the database optimizer, indexes, data size, and query structure.

## 12. Real-World Data Science Use Cases

Subqueries are useful in data analysis for:
- Finding customers spending more than average.
- Identifying products with sales above a certain threshold.
- Finding employees earning more than their department average.
- Identifying customers who never placed orders.
- Finding departments with above-average employee counts.
- Comparing individual performance against overall business performance.

## 13. Common Mistakes to Avoid

- Forgetting parentheses around subqueries.
- Using `=` when the inner query returns multiple rows.
- Using `NOT IN` without considering NULL values.
- Confusing correlated and non-correlated subqueries.
- Returning multiple columns when the comparison expects one.
- Using unnecessary nested subqueries that make queries difficult to understand.

## 14. SQL Interview Questions

**Q1. What is a Subquery in SQL?**

A query written inside another SQL query.

**Q2. What is a Correlated Subquery?**

A subquery that references columns from the outer query.

**Q3. What is the difference between IN and EXISTS?**

IN checks whether a value matches a value in a result set. EXISTS checks whether the subquery returns at least one row.

**Q4. Can we use a Subquery inside SELECT?**

Yes. A subquery can be used in SELECT, FROM, WHERE, and other supported SQL expressions.

**Q5. What is a Derived Table?**

A subquery used in the FROM clause, which acts as a temporary result table for the outer query.

## Practice Questions

Try writing SQL queries for these problems:
1. Find employees earning more than the company's average salary.
2. Find customers who have placed at least one order using EXISTS.
3. Find customers who have never placed an order using NOT EXISTS.
4. Find employees earning more than their department's average salary.
5. Find departments whose average salary is greater than 60,000.

## Key Takeaways

- A Subquery is a query inside another query.
- Single-row subqueries return one row.
- Multiple-row subqueries can return several rows.
- IN checks for matching values.
- EXISTS checks whether matching records exist.
- NOT EXISTS helps identify records without matches.
- Correlated subqueries depend on the outer query.
- Derived tables are subqueries used in FROM.

---

📍 *Double Tap ❤️ For More*