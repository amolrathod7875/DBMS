# Phase 3: SQL — Topic 40: LIMIT and TOP — Restricting Rows in SQL 🔢

When working with large databases, you don't always need to retrieve every record. SQL provides `LIMIT` and `TOP` to restrict the number of rows returned by a query. These clauses are especially useful when finding top-performing employees, highest transactions, latest orders, or popular products.

## 1. What is LIMIT?

`LIMIT` restricts the number of rows returned by a query.

**Syntax:**

```sql
SELECT column1, column2
FROM table_name
LIMIT number;
```

**Example:**

```sql
SELECT *
FROM Employees
LIMIT 3;
```

This returns only the first three rows from the query result.

## 2. LIMIT with ORDER BY

One of the most common use cases is finding the top records based on a particular column.

**Example:** Find the three highest-paid employees.

```sql
SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 3;
```

This query:
- Sorts employees by salary in descending order.
- Returns only the first three records.

> **Important:** Always use `ORDER BY` when you need a meaningful top-N result.

## 3. What is TOP?

`TOP` is commonly used in Microsoft SQL Server to restrict the number of rows returned.

```sql
SELECT TOP 3 *
FROM Employees;
```

**Example:** Find the five highest-paid employees.

```sql
SELECT TOP 5
    Name,
    Salary
FROM Employees
ORDER BY Salary DESC;
```

## 4. LIMIT vs TOP

Both `LIMIT` and `TOP` are used to restrict the number of rows returned by a SQL query.

| Feature | LIMIT | TOP |
|---|---|---|
| Databases | MySQL, PostgreSQL, SQLite | Microsoft SQL Server |
| Position | Written at the end of the query | Written immediately after SELECT |
| Purpose | Specifies maximum number of rows to return | Specifies maximum number of rows to return |

> **Note:** PostgreSQL and SQLite support `LIMIT`, while SQL Server supports `TOP`. Other databases may use different syntax.

## 5. LIMIT with OFFSET

`OFFSET` allows you to skip a specific number of rows before returning results.

```sql
SELECT *
FROM Employees
LIMIT 3 OFFSET 2;
```

This skips the first two rows and returns the next three rows.

**Example data:**

| Employee_ID | Name  | Salary |
|---|---|---|
| 101 | Rahul | 50000 |
| 102 | Priya | 45000 |
| 103 | Amit  | 60000 |
| 104 | Sneha | 55000 |
| 105 | Karan | 40000 |

After sorting by Employee_ID:

```sql
SELECT *
FROM Employees
ORDER BY Employee_ID
LIMIT 2 OFFSET 2;
```

**Output:**

| Employee_ID | Name |
|---|---|
| 103 | Amit |
| 104 | Sneha |

## 6. Pagination Using LIMIT and OFFSET

Pagination means displaying records in smaller groups instead of loading everything at once. For example, displaying 10 employees per page.

**Page 1:**

```sql
SELECT *
FROM Employees
ORDER BY Employee_ID
LIMIT 10 OFFSET 0;
```

**Page 2:**

```sql
SELECT *
FROM Employees
ORDER BY Employee_ID
LIMIT 10 OFFSET 10;
```

**Page 3:**

```sql
SELECT *
FROM Employees
ORDER BY Employee_ID
LIMIT 10 OFFSET 20;
```

This technique is commonly used in websites, dashboards, and applications.

## 7. TOP with PERCENT

SQL Server also supports `TOP PERCENT`.

```sql
SELECT TOP 20 PERCENT *
FROM Employees
ORDER BY Salary DESC;
```

This retrieves approximately the top 20% of rows based on salary.

## 8. TOP WITH TIES

SQL Server supports `WITH TIES`, which includes additional rows tied with the last selected row based on the ORDER BY values.

```sql
SELECT TOP 3 WITH TIES
    Name,
    Salary
FROM Employees
ORDER BY Salary DESC;
```

If multiple employees have the same salary as the third employee, all tied employees are included.

## 9. Real-World Banking Example

Suppose your manager asks: "Find the top 10 customers with the highest account balances."

**MySQL / PostgreSQL:**

```sql
SELECT
    Customer_ID,
    Customer_Name,
    Account_Balance
FROM Customers
ORDER BY Account_Balance DESC
LIMIT 10;
```

**SQL Server:**

```sql
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    Account_Balance
FROM Customers
ORDER BY Account_Balance DESC;
```

Both queries retrieve the 10 customers with the highest account balances.

## 10. Common Mistakes to Avoid

- Using `LIMIT` in SQL Server (use `TOP` instead).
- Using `TOP` in MySQL (use `LIMIT` instead).
- Forgetting `ORDER BY` when selecting top-N records.
- Confusing `LIMIT` with `OFFSET`.
- Using a large `OFFSET` on huge tables without considering performance.
- Assuming the database returns rows in a guaranteed order without `ORDER BY`.

## 🔑 Key Takeaways

- `LIMIT` restricts the number of returned rows.
- `TOP` is commonly used in SQL Server.
- `ORDER BY` + `LIMIT` is useful for top-N analysis.
- `OFFSET` skips a specified number of rows.
- Pagination helps retrieve data in smaller batches.
- `WITH TIES` includes additional tied rows in SQL Server.

---

📌 *Double Tap ❤️ For More*