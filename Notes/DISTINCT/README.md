# Phase 3: SQL for Data Science — Topic 5: DISTINCT

DISTINCT is used to remove duplicate values from the result of a SQL query. It is useful when you want to know the unique:
- Departments
- Cities
- Customers
- Product categories
- Job titles
- Countries

## Basic Syntax

```sql
SELECT DISTINCT column_name
FROM table_name;
```

**Example:**

```sql
SELECT DISTINCT department
FROM employees;
```

If the table contains:
```
IT
HR
IT
Finance
HR
IT
```

The result will be:
```
IT
HR
Finance
```

Each department appears only once.

## DISTINCT with Multiple Columns

You can use DISTINCT with more than one column.

```sql
SELECT DISTINCT department, job_title
FROM employees;
```

**Important:** SQL considers the combination of both columns.

Suppose the data is:
```
IT       Analyst
IT       Developer
IT       Analyst
HR       Analyst
HR       Manager
```

The result is:
```
IT       Analyst
IT       Developer
HR       Analyst
HR       Manager
```

The duplicate IT + Analyst combination is removed.

## DISTINCT Does Not Mean Unique for Each Column

Consider:

```sql
SELECT DISTINCT department, city
FROM employees;
```

This does not return unique departments and unique cities separately. It returns unique combinations of department + city.

For example:
```
IT       Pune
IT       Mumbai
IT       Pune
HR       Pune
```

becomes:
```
IT       Pune
IT       Mumbai
HR       Pune
```

## DISTINCT with WHERE

You can filter the data before finding unique values.

```sql
SELECT DISTINCT department
FROM employees
WHERE salary > 70000;
```

This returns departments that have employees earning more than 70,000.

## DISTINCT with ORDER BY

You can also sort the unique results.

```sql
SELECT DISTINCT department
FROM employees
ORDER BY department ASC;
```

Result:
```
Finance
HR
IT
```

## DISTINCT with LIMIT

You can combine DISTINCT, ORDER BY, and LIMIT.

```sql
SELECT DISTINCT department
FROM employees
ORDER BY department
LIMIT 3;
```

This returns the first 3 unique departments according to the specified ordering.

## DISTINCT and NULL

DISTINCT treats repeated NULL values as one distinct result.

```sql
SELECT DISTINCT city
FROM customers;
```

If the data contains:
```
Pune
Mumbai
Pune
NULL
NULL
Delhi
```

The result will contain one NULL entry:
```
Pune
Mumbai
NULL
Delhi
```

## DISTINCT vs GROUP BY

Both can sometimes produce similar results.

```sql
SELECT DISTINCT department
FROM employees;
```

and:

```sql
SELECT department
FROM employees
GROUP BY department;
```

can both return unique departments.

But their purpose is different.

- **DISTINCT** → remove duplicate result rows.
- **GROUP BY** → create groups, usually so you can perform calculations such as COUNT(), SUM(), AVG(), MIN(), MAX().

For simply finding unique values, DISTINCT is usually clearer.

## Real-World Data Science Example

Suppose you're exploring a customer dataset and want to understand which countries are represented.

```sql
SELECT DISTINCT country
FROM customers;
```

This is useful during exploratory data analysis because you can quickly understand the categories present in the dataset.

Another example:

```sql
SELECT DISTINCT payment_method
FROM transactions;
```

You might discover:
- Credit Card
- Debit Card
- UPI
- Bank Transfer

This gives you the unique categories before deeper analysis.

## Common Mistakes

### Mistake 1 — Thinking DISTINCT removes duplicates from the table

It does not modify the table.

```sql
SELECT DISTINCT department
FROM employees;
```

Only the query result is affected. The original data remains unchanged.

### Mistake 2 — Using DISTINCT unnecessarily

```sql
SELECT DISTINCT employee_id, employee_name
FROM employees;
```

This may be unnecessary if employee_id is already unique.

### Mistake 3 — Misunderstanding multiple columns

```sql
SELECT DISTINCT city, department
FROM employees;
```

This means unique city + department combinations, not unique cities and unique departments separately.

## Interview Questions

**1. What is DISTINCT?**

DISTINCT removes duplicate rows from the query result.

**2. Does DISTINCT modify the original table?**

No. It only affects the result returned by the query.

**3. Can DISTINCT be used with multiple columns?**

Yes.
```sql
SELECT DISTINCT department, city
FROM employees;
```

**4. What is the difference between DISTINCT and GROUP BY?**

DISTINCT is primarily used to remove duplicate results, while GROUP BY is mainly used to create groups for aggregation.

**5. How do you find all unique cities?**

```sql
SELECT DISTINCT city
FROM customers;
```

## Practice Questions

1. Write a query to find all unique departments from the employees table.
2. Write a query to find all unique cities from the customers table.
3. Write a query to find unique combinations of department and job_title.
4. Write a query to find unique payment methods used in the transactions table.
5. Write a query to find unique product categories and display them alphabetically.

## Key Takeaways

- DISTINCT removes duplicate rows from query results.
- It does not change the original table.
- It can be used with one or multiple columns.
- With multiple columns, uniqueness is based on the combination.
- DISTINCT can be combined with WHERE, ORDER BY, and LIMIT.
- Use DISTINCT when you simply need unique values.
- Use GROUP BY when you need grouped calculations.

---

📍 *Double Tap ❤️ For More*