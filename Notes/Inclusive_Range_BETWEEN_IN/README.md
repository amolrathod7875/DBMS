# Inclusive Range in MySQL — BETWEEN and IN

## Overview

In MySQL, `BETWEEN` and `IN` are two powerful operators used for filtering data within ranges or lists of values. Understanding their inclusive nature and correct usage is essential for writing accurate SQL queries.

## 1. BETWEEN Operator

`BETWEEN` is used to filter values within a specified **inclusive range**. It includes both boundary values.

### Basic Syntax

```sql
SELECT column1, column2
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

### Example: Salary Range

```sql
SELECT employee_name, salary
FROM employees
WHERE salary BETWEEN 40000 AND 55000;
```

This returns employees with salaries from 40000 to 55000, **including** both 40000 and 55000.

### Important: BETWEEN is Inclusive

```sql
WHERE salary BETWEEN 40000 AND 55000
```

is equivalent to:

```sql
WHERE salary >= 40000 AND salary <= 55000
```

Both boundary values are **included** in the result.

### BETWEEN with Numbers

```sql
SELECT product_name, price
FROM products
WHERE price BETWEEN 1000 AND 5000;
```

Returns products priced from 1000 to 5000, including 1000 and 5000.

### BETWEEN with Dates

```sql
SELECT order_id, order_date
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-01-31';
```

Returns orders from January 1 to January 31, 2026, inclusive.

> **Note:** If the column contains timestamps (not just dates), using `BETWEEN '2026-01-01' AND '2026-01-31'` may miss records on January 31 after midnight. Use the half-open range instead:
> ```sql
> WHERE order_date >= '2026-01-01' AND order_date < '2026-02-01'
> ```

### BETWEEN with Text

```sql
SELECT customer_name
FROM customers
WHERE customer_name BETWEEN 'A' AND 'M';
```

Returns names starting with letters A through M (inclusive of names starting with M).

### BETWEEN is NOT for Strings in the Middle

```sql
-- This finds names from 'Alice' to 'Mumbai' alphabetically
WHERE customer_name BETWEEN 'Alice' AND 'Mumbai'
```

## 2. IN Operator

`IN` checks whether a value matches **any** value in a specified list. It is a cleaner alternative to multiple `OR` conditions.

### Basic Syntax

```sql
SELECT column1, column2
FROM table_name
WHERE column_name IN (value1, value2, value3, ...);
```

### Example: Department Filter

```sql
SELECT employee_name, department
FROM employees
WHERE department IN ('IT', 'HR', 'Finance');
```

Returns employees from IT, HR, or Finance departments.

### IN with Numbers

```sql
SELECT product_name, price
FROM products
WHERE product_id IN (301, 302, 303);
```

Returns products with IDs 301, 302, or 303.

### IN with Subquery

```sql
SELECT employee_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Mumbai'
);
```

Returns employees whose department is located in Mumbai.

### NOT IN

Returns records that do **not** match any value in the list.

```sql
SELECT customer_name, city
FROM customers
WHERE city NOT IN ('Pune', 'Mumbai');
```

Returns customers not from Pune or Mumbai.

> **Warning:** Be careful with `NOT IN` when the subquery or list contains NULL values. A NULL in the list can cause the condition to evaluate as unknown, returning no rows. Use `NOT EXISTS` as a safer alternative.

## 3. BETWEEN vs IN

| Feature | BETWEEN | IN |
|---|---|---|
| Purpose | Range of values | List of specific values |
| Inclusive | Yes (both boundaries) | Yes (all listed values) |
| Works with | Numbers, dates, text | Numbers, text, subqueries |
| Alternative | `>=` AND `<=` | Multiple `OR` conditions |

### When to Use BETWEEN
- Salary ranges: `BETWEEN 40000 AND 60000`
- Date ranges: `BETWEEN '2026-01-01' AND '2026-12-31'`
- Price ranges: `BETWEEN 100 AND 500`

### When to Use IN
- Specific departments: `IN ('IT', 'HR', 'Finance')`
- Specific IDs: `IN (101, 102, 103)`
- Checking membership: `IN (SELECT ...)` 

## 4. Common Mistakes

### Mistake 1: Using BETWEEN with Wrong Order

```sql
-- WRONG: Returns nothing (lower > upper)
WHERE salary BETWEEN 60000 AND 40000

-- CORRECT: Lower value first
WHERE salary BETWEEN 40000 AND 60000
```

### Mistake 2: Forgetting BETWEEN is Inclusive

```sql
-- If you want strictly greater than 40000 and strictly less than 60000:
-- DON'T use BETWEEN (it includes boundaries)
WHERE salary BETWEEN 40000 AND 60000  -- includes 40000 and 60000

-- DO use:
WHERE salary > 40000 AND salary < 60000
```

### Mistake 3: Using = NULL with IN

```sql
-- WRONG
WHERE city IN (NULL, 'Pune')

-- CORRECT: Use IS NULL separately
WHERE city IS NULL OR city IN ('Pune')
```

### Mistake 4: NOT IN with NULL Values

```sql
-- If department_id can be NULL, NOT IN returns no rows
WHERE department_id NOT IN (1, 2, 3)  -- Fails if any row has NULL department_id

-- SAFER: Use NOT EXISTS
WHERE NOT EXISTS (
    SELECT 1 FROM excluded_depts e WHERE e.dept_id = employees.department_id
)
```

## 5. Real-World Examples

### Example 1: Find mid-range products

```sql
SELECT product_name, price
FROM products
WHERE price BETWEEN 1000 AND 10000
ORDER BY price DESC;
```

### Example 2: Find employees from specific departments

```sql
SELECT employee_name, department
FROM employees
WHERE department IN ('IT', 'HR')
ORDER BY employee_name;
```

### Example 3: Find orders in Q1 2026

```sql
SELECT order_id, order_date, amount
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY order_date;
```

### Example 4: Find products not in certain categories

```sql
SELECT product_name, category
FROM products
WHERE category NOT IN ('Stationery', 'Furniture');
```

## 6. Interview Questions

**Q1. Is BETWEEN inclusive in MySQL?**

Yes. `BETWEEN value1 AND value2` includes both `value1` and `value2`. It is equivalent to `>= value1 AND <= value2`.

**Q2. What is the difference between BETWEEN and IN?**

`BETWEEN` filters a continuous range of values (inclusive). `IN` checks membership in a discrete list of values.

**Q3. Can you use BETWEEN with text values?**

Yes. `WHERE name BETWEEN 'A' AND 'M'` returns names starting with A through M.

**Q4. What happens if you use NOT IN with a NULL value in the list?**

The query may return no rows because NULL comparisons evaluate to UNKNOWN. Use `NOT EXISTS` for safer NULL handling.

**Q5. Is BETWEEN faster than using >= and <=?**

In most databases, `BETWEEN` and `>= AND <=` are optimized similarly. The choice is mostly about readability.

## 7. Practice Questions

1. Find employees with salary between 50000 and 80000.
2. Find products priced between 1000 and 10000.
3. Find customers from cities IN ('Pune', 'Mumbai', 'Delhi').
4. Find orders placed between '2026-01-01' and '2026-03-31'.
5. Find products NOT IN categories ('Electronics', 'Furniture').

## 🔑 Key Takeaways

- `BETWEEN` is **inclusive** — includes both boundary values.
- `BETWEEN` is equivalent to `>= AND <=`.
- `IN` checks membership in a list of values.
- `IN` is a cleaner alternative to multiple `OR` conditions.
- `NOT IN` can be dangerous with NULL values — use `NOT EXISTS` instead.
- `BETWEEN` works with numbers, dates, and text.
- Always put the lower value first in `BETWEEN`.

---

📌 *Double Tap ❤️ For More*