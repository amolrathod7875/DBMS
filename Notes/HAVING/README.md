# Phase 3: SQL for Data Science — Topic 7: HAVING

HAVING is used to filter grouped results.

The most important thing to remember:

- `WHERE` → filters rows
- `HAVING` → filters groups

## Why Do We Need HAVING?

Suppose you want to find departments that have more than 5 employees.

First, you need to group employees by department:

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

But if you want only departments with more than 5 employees, use HAVING:

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

The grouping happens first, and then HAVING filters the groups.

## Basic Syntax

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

## HAVING with COUNT()

Find departments having more than 10 employees:

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 10;
```

## HAVING with SUM()

Find regions where total sales exceed 100000:

```sql
SELECT region, SUM(sales) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(sales) > 100000;
```

## HAVING with AVG()

Find departments where the average salary is greater than 70000:

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;
```

## HAVING with MAX()

Find departments where the highest salary is greater than 150000:

```sql
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 150000;
```

## WHERE vs HAVING

This is one of the most frequently asked SQL interview questions.

### WHERE

Filters individual rows.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

It removes individual records that don't meet the condition.

### HAVING

Filters groups after GROUP BY.

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;
```

It removes entire groups that don't meet the condition.

## Using WHERE and HAVING Together

You can use both.

Suppose you want departments where:
- Only employees earning more than 50000 are considered
- The department must have at least 5 such employees

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) >= 5;
```

**Conceptually:**

```
All employees
     ↓
WHERE
     ↓
Employees with salary > 50000
     ↓
GROUP BY
     ↓
Create department groups
     ↓
HAVING
     ↓
Keep groups with at least 5 employees
```

## HAVING with ORDER BY

You can also sort the filtered groups.

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 500000
ORDER BY total_salary DESC;
```

This finds departments whose total salary exceeds 500000 and displays the highest totals first.

## HAVING Without GROUP BY

Some SQL databases allow HAVING without an explicit GROUP BY, treating the entire result as a single group.

For example:

```sql
SELECT COUNT(*) AS employee_count
FROM employees
HAVING COUNT(*) > 100;
```

This returns the result only if there are more than 100 employees.

For beginners, however, focus primarily on the common pattern: `GROUP BY → HAVING`

## Common Mistake

❌ **Incorrect:**

```sql
SELECT department, COUNT(*)
FROM employees
WHERE COUNT(*) > 5
GROUP BY department;
```

Aggregate functions such as `COUNT()` generally cannot be used in WHERE.

✅ **Correct:**

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

## Real-World Data Science Example

Suppose you're analyzing customer transactions. You want customers who have made at least 10 transactions:

```sql
SELECT customer_id,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY customer_id
HAVING COUNT(*) >= 10;
```

This can help identify:
- Frequent customers
- High-engagement users
- Active accounts
- Customers suitable for segmentation

Another example — Find products generating more than 50000 in revenue:

```sql
SELECT product_id,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY product_id
HAVING SUM(quantity * price) > 50000
ORDER BY revenue DESC;
```

## Interview Questions

**1. What is HAVING?**

HAVING filters groups created by GROUP BY.

**2. What is the difference between WHERE and HAVING?**

- `WHERE` filters rows before grouping.
- `HAVING` filters groups after grouping.

**3. Can HAVING be used with aggregate functions?**

Yes.

```sql
HAVING COUNT(*) > 5
```

**4. Can WHERE and HAVING be used together?**

Yes.

```sql
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) > 5
```

**5. Why can't we normally use COUNT() in WHERE?**

Because WHERE operates on individual rows before the aggregation is performed. HAVING is designed to filter aggregated groups.

## Practice Questions

1. Find departments with more than 10 employees.
2. Find customers who have made at least 5 transactions.
3. Find regions where total sales exceed 100000.
4. Find departments where average salary is greater than 75000.
5. Find products whose total revenue exceeds 50000 and sort them from highest to lowest revenue.

## 🎯 Key Takeaways

- `WHERE` → Filters rows.
- `GROUP BY` → Creates groups.
- `HAVING` → Filters groups.
- `WHERE` is applied before grouping.
- `HAVING` is applied after grouping.
- `HAVING` is commonly used with `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`.
- `WHERE + GROUP BY + HAVING` is one of the most important SQL patterns for analytics.

---

📌 *Double Tap ❤️ For More*