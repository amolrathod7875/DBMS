# Phase 3: SQL for Data Science — Topic 4: LIMIT

LIMIT is used to control how many rows a SQL query returns. It is especially useful when you want to see only the first few records, such as:
- Top 5 highest salaries
- Top 10 products by sales
- First 20 customers
- Latest 10 transactions

## Basic Syntax

```sql
SELECT *
FROM employees
LIMIT 5;
```

This returns only 5 rows from the result.

## LIMIT with ORDER BY

This is where LIMIT becomes especially powerful.

Suppose you want the 5 highest-paid employees:

```sql
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;
```

The logical idea is: Filter → Sort → Take required number of rows

For example:
```
Salary
120000
110000
95000
90000
85000
```

Only the top 5 rows are returned.

## LIMIT Without ORDER BY

You can write:

```sql
SELECT *
FROM employees
LIMIT 5;
```

But without ORDER BY, you should not assume these are the "first" or "top" 5 meaningful records. The database does not guarantee a particular order unless you explicitly specify one.

So for analysis, this is usually better:

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
```

## LIMIT with WHERE

You can combine WHERE, ORDER BY, and LIMIT.

```sql
SELECT employee_name, salary
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 3;
```

This finds the 3 highest-paid employees in the IT department.

## LIMIT for Top-N Analysis

Top-N queries are extremely common in data analysis.

### Top 10 products by sales

```sql
SELECT product_name, sales
FROM products
ORDER BY sales DESC
LIMIT 10;
```

### 5 most recent transactions

```sql
SELECT transaction_id, transaction_date, amount
FROM transactions
ORDER BY transaction_date DESC
LIMIT 5;
```

### 3 cheapest products

```sql
SELECT product_name, price
FROM products
ORDER BY price ASC
LIMIT 3;
```

## LIMIT with OFFSET

OFFSET allows you to skip a certain number of rows before returning results.

```sql
SELECT *
FROM employees
LIMIT 5 OFFSET 10;
```

This means:
- Skip 10 rows
- Return the next 5 rows

This is commonly used for pagination.

For example:
- Page 1 → LIMIT 10 OFFSET 0
- Page 2 → LIMIT 10 OFFSET 10
- Page 3 → LIMIT 10 OFFSET 20

Syntax can vary between SQL databases, so always check the specific database you are using.

## LIMIT vs TOP vs FETCH

Different SQL databases may use different syntax.

**MySQL / PostgreSQL / SQLite** commonly use:
```sql
LIMIT 5;
```

**SQL Server** commonly uses:
```sql
SELECT TOP 5 *
FROM employees;
```

**Standard SQL** also supports:
```sql
FETCH FIRST 5 ROWS ONLY;
```

The concept is the same: restrict the number of returned rows.

## Real-World Data Science Example

Suppose an analyst wants to investigate the 10 largest customer transactions.

```sql
SELECT customer_id,
       transaction_id,
       amount
FROM transactions
ORDER BY amount DESC
LIMIT 10;
```

This can help identify:
- High-value transactions
- Potential anomalies
- Important customers
- Transactions requiring further investigation

## Common Mistakes

### Mistake 1 — Using LIMIT without sorting

```sql
SELECT *
FROM products
LIMIT 10;
```

This does not necessarily mean "10 best products."

For that:
```sql
ORDER BY sales DESC
LIMIT 10;
```

### Mistake 2 — Using ASC when you need the highest values

Wrong:
```sql
ORDER BY salary ASC
LIMIT 5;
```
This returns the lowest salaries.

For the highest salaries:
```sql
ORDER BY salary DESC
LIMIT 5;
```

### Mistake 3 — Forgetting that LIMIT applies after sorting

For a top-N analysis, think: ORDER BY → LIMIT, not simply LIMIT → assume top records.

## Interview Questions

**1. What is LIMIT?**

LIMIT restricts the number of rows returned by a query.

**2. How do you find the top 10 salaries?**

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 10;
```

**3. Can LIMIT be used with WHERE?**

Yes.
```sql
SELECT *
FROM employees
WHERE department = 'Finance'
LIMIT 5;
```

**4. Why is ORDER BY important when using LIMIT?**

Because without sorting, the returned rows are not necessarily the highest, lowest, newest, or oldest records you want.

**5. What is OFFSET used for?**

OFFSET skips a specified number of rows before returning the requested rows, commonly for pagination.

---

📍 *Double Tap ❤️ For More*