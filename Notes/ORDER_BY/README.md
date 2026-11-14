# Phase 3: SQL for Data Science — Topic 3: ORDER BY

ORDER BY is used to sort the rows returned by a SQL query. It helps you arrange data in a meaningful order, such as:
- Highest salary to lowest salary
- Lowest price to highest price
- Newest date to oldest date
- A–Z or Z–A
- Highest sales to lowest sales

## Basic Syntax

```sql
SELECT column1, column2
FROM table_name
ORDER BY column_name;
```

By default, SQL sorts in ascending order.

```sql
SELECT *
FROM employees
ORDER BY salary;
```

This generally returns employees from the lowest salary to the highest salary.

## ASC — Ascending Order

ASC means ascending.

```sql
SELECT *
FROM employees
ORDER BY salary ASC;
```

For numbers: 10000, 25000, 40000, 75000, 100000
For text: Amazon, Apple, Google, Microsoft
For dates: 2024-01-01, 2024-05-15, 2024-12-20, 2025-03-10

ASC is usually the default, so `ORDER BY salary;` is equivalent to `ORDER BY salary ASC;`

## DESC — Descending Order

DESC means descending.

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

Example: 100000, 75000, 40000, 25000, 10000

This is especially useful when you want to find:
- Highest-paid employees
- Top-selling products
- Most expensive products
- Most recent transactions
- Highest-performing regions

## Sorting Text

You can sort text columns alphabetically.

```sql
SELECT employee_name, department
FROM employees
ORDER BY employee_name ASC;
```

```sql
SELECT employee_name, department
FROM employees
ORDER BY employee_name DESC;
```

## Sorting Dates

To find the most recent transactions:

```sql
SELECT transaction_id, transaction_date, amount
FROM transactions
ORDER BY transaction_date DESC;
```

To see transactions from oldest to newest:

```sql
SELECT transaction_id, transaction_date, amount
FROM transactions
ORDER BY transaction_date ASC;
```

## Sorting by Multiple Columns

This is very important. Suppose you want to sort employees:
1. By department
2. Within each department, by salary from highest to lowest

```sql
SELECT employee_name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;
```

SQL first sorts by department. When multiple rows have the same department, it then uses salary to determine their order.

Example:
```
Finance 90000
Finance 70000
Finance 50000
HR 85000
HR 60000
IT 120000
IT 95000
```

## ORDER BY with Calculations

You can also sort using an expression.

```sql
SELECT product_name, quantity, price,
       quantity * price AS total_value
FROM products
ORDER BY quantity * price DESC;
```

You can also use the alias in many SQL databases:

```sql
SELECT product_name,
       quantity * price AS total_value
FROM products
ORDER BY total_value DESC;
```

## ORDER BY with DISTINCT

```sql
SELECT DISTINCT department
FROM employees
ORDER BY department ASC;
```

This returns each department once and sorts them alphabetically.

## ORDER BY and NULL Values

NULL represents a missing or unknown value. The position of NULL values when using ORDER BY can vary between SQL databases.

Some databases also support explicit control such as:
`ORDER BY salary ASC NULLS LAST;` or `ORDER BY salary DESC NULLS FIRST;`

Always check the syntax supported by your SQL database.

## ORDER BY with WHERE

WHERE filters the rows first, and ORDER BY sorts the resulting rows.

```sql
SELECT employee_name, salary
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC;
```

## Real-World Data Science Example

Suppose you are analyzing sales data. You want to identify the highest-value transactions.

```sql
SELECT customer_id, product_id, quantity, price,
       quantity * price AS transaction_value
FROM sales
ORDER BY transaction_value DESC;
```

This can help with:
- Finding high-value transactions
- Identifying important customers
- Investigating unusually large purchases
- Preparing data for further analysis

## Common Mistakes

### Mistake 1 — Forgetting DESC

If you want the highest salary first: `ORDER BY salary DESC`. Not `ORDER BY salary;`

### Mistake 2 — Wrong column

Make sure the column used for sorting actually represents what you want to analyze.

### Mistake 3 — Incorrect multiple-column ordering

`ORDER BY department, salary DESC;` does NOT mean both columns are descending. It means: department → ASC, salary → DESC

If you want both descending: `ORDER BY department DESC, salary DESC;`

### Mistake 4 — Confusing WHERE and ORDER BY

WHERE filters rows. ORDER BY sorts rows. They perform different jobs.

## Interview Questions

**1. What is ORDER BY?**

ORDER BY sorts query results based on one or more columns.

**2. What is the default sorting order?**

Ascending order (ASC) is generally the default.

**3. How do you find the highest salary?**

`SELECT * FROM employees ORDER BY salary DESC;`

**4. Can you sort using multiple columns?**

Yes. `ORDER BY department ASC, salary DESC;`

**5. What is the difference between ASC and DESC?**

ASC sorts from low to high or A–Z. DESC sorts from high to low or Z–A.

## Practice Questions

1. Write a query to display all products from the cheapest to the most expensive.
2. Write a query to display employees from the highest salary to the lowest salary.
3. Write a query to display customers alphabetically by name.
4. Write a query to sort sales by date, showing the newest sales first.
5. Write a query to sort employees by department alphabetically and salary from highest to lowest within each department.

## Key Takeaways

- ORDER BY sorts query results
- ASC means ascending
- DESC means descending
- Ascending is generally the default
- You can sort numbers, text and dates
- You can sort using multiple columns
- WHERE filters data; ORDER BY sorts data
- ORDER BY is especially useful when analyzing rankings and top/bottom records

---

📍 *Double Tap ❤️ For More*