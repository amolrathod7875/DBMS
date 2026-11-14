# Phase 3: SQL for Data Science — Topic 11: Views in SQL

Today, let's learn about one of the useful SQL concepts: Views. Views help us simplify complex queries, organize data, and create reusable SQL logic.

## 1. What is a View in SQL?

A View is a virtual table created using the result of a SQL query. It does not normally store the actual data separately. Instead, it stores the SQL query definition and retrieves data from the underlying tables when accessed.

**Example:**

Suppose you have an employees table with thousands of records. You frequently need only employee names, departments, and salaries. Instead of writing the same SELECT query repeatedly, you can create a View.

```sql
CREATE VIEW employee_details AS
SELECT employee_id,
       employee_name,
       department,
       salary
FROM employees;
```

Now you can access it like a regular table:

```sql
SELECT *
FROM employee_details;
```

## 2. Why Do We Use Views?

Views are useful for several reasons:
- Simplify complex SQL queries.
- Reuse frequently executed queries.
- Restrict access to sensitive columns.
- Organize data for reporting.
- Provide a consistent structure for analysts.
- Make dashboards and reports easier to maintain.

## 3. How to Create a View

**Syntax:**

```sql
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
```

Create a View containing employees earning more than 60,000:

```sql
CREATE VIEW high_salary_employees AS
SELECT employee_id,
       employee_name,
       salary
FROM employees
WHERE salary > 60000;
```

**Access the View:**

```sql
SELECT *
FROM high_salary_employees;
```

The View displays only employees matching the condition.

## 4. How to Update a View

If you want to change the query behind an existing View, you can use `CREATE OR REPLACE VIEW` in databases that support it.

```sql
CREATE OR REPLACE VIEW employee_details AS
SELECT employee_id,
       employee_name,
       department,
       salary,
       joining_date
FROM employees;
```

This replaces the existing View definition.

> **Note:** SQL syntax varies by database. SQL Server commonly uses `CREATE OR ALTER VIEW` instead.

## 5. How to Delete a View

If you no longer need a View, use `DROP VIEW`.

```sql
DROP VIEW employee_details;
```

This removes the View definition.

> **Important:** Dropping a View does not delete the original table or its records.

## 6. Views with JOIN

You can create Views using multiple tables and JOIN operations.

Suppose you have two tables: employees and departments.

Create a View combining employee and department details:

```sql
CREATE VIEW employee_department AS
SELECT e.employee_id,
       e.employee_name,
       d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;
```

Now you can access the combined information:

```sql
SELECT *
FROM employee_department;
```

This saves you from repeatedly writing the JOIN query.

## 7. Views with GROUP BY

You can also create Views using aggregate functions.

Create a View showing average salary by department:

```sql
CREATE VIEW department_salary AS
SELECT department,
       AVG(salary) AS average_salary,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

Access it:

```sql
SELECT *
FROM department_salary;
```

This is especially useful for business reporting.

## 8. What is an Updatable View?

An Updatable View allows certain changes to be made through the View, such as:
- INSERT
- UPDATE
- DELETE

```sql
CREATE VIEW pune_employees AS
SELECT employee_id,
       employee_name,
       city
FROM employees
WHERE city = 'Pune';
```

You may be able to update records through this View:

```sql
UPDATE pune_employees
SET city = 'Mumbai'
WHERE employee_id = 101;
```

> **Important:** The underlying table may also be updated.

Not all Views are updatable. Views containing GROUP BY, aggregate functions, DISTINCT, or complex JOINs often have restrictions. Exact rules depend on the database.

## 9. View vs Table vs Materialized View

These are important concepts for interviews.

### Table
- Stores actual data.
- Data is physically stored in the database.
- Supports regular data operations.

### View
- Stores a query definition.
- Normally retrieves data from underlying tables.
- Useful for simplifying queries and controlling access.

### Materialized View
- Stores the result of a query physically.
- Can make repeated analytical queries faster.
- Needs refreshing to reflect changes in underlying data.

```sql
CREATE MATERIALIZED VIEW sales_summary AS
SELECT product_id,
       SUM(amount) AS total_sales
FROM sales
GROUP BY product_id;
```

> **Note:** Materialized View syntax and refresh behavior depend on the database. For example, PostgreSQL supports this syntax.

## 10. Real-World Data Science Use Cases

Views are commonly used in data analytics and reporting:
- Creating customer summary datasets.
- Preparing data for Power BI dashboards.
- Combining multiple tables for reporting.
- Hiding sensitive employee information.
- Creating reusable sales reports.
- Simplifying complex business queries.

A company wants to create a sales summary for its reporting team:

```sql
CREATE VIEW monthly_sales AS
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(amount) AS total_sales
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date);
```

The reporting team can use this View without rewriting the aggregation query.

## 11. Common Mistakes to Avoid

- Assuming a normal View stores data physically.
- Thinking DROP VIEW deletes the original table.
- Assuming every View can be updated.
- Forgetting that changes in underlying tables can affect View results.
- Creating unnecessarily complicated Views.
- Assuming Views automatically improve query performance.

## 12. SQL Interview Questions

**Q1. What is a View in SQL?**

A View is a virtual table based on the result of a SQL query.

**Q2. Does a View store actual data?**

A normal View generally stores the query definition, not a separate copy of the data.

**Q3. Can we create a View using JOIN?**

Yes. A View can combine multiple tables using JOIN.

**Q4. What is a Materialized View?**

A Materialized View physically stores the result of a query and can be refreshed when needed.

**Q5. Can we update data through a View?**

Yes, if the View satisfies the database's updatability rules.

## Practice Questions

1. Create a View displaying employee names and departments.
2. Create a View for employees earning more than 50,000.
3. Create a View combining customers and orders.
4. Create a View showing total sales by product.
5. Delete an existing View using DROP VIEW.

## Key Takeaways

- A View is a virtual table based on a SQL query.
- CREATE VIEW creates a View.
- CREATE OR REPLACE VIEW modifies its definition in supported databases.
- DROP VIEW removes a View.
- Views can use JOIN, GROUP BY, and aggregate functions.
- Materialized Views physically store query results.
- Views are useful for reporting, analytics, and data security.

---

📍 *Double Tap ❤️ For More*