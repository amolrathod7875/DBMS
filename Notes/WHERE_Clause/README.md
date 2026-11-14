# Phase 3: SQL — Topic 38: WHERE Clause - Filtering Data in SQL 🔍

The `WHERE` clause filters records based on specific conditions. It helps you retrieve only the rows that match your requirements instead of returning the entire table.

## 1. Basic Syntax

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

**Example:** Consider an Employees table.

| Employee_ID | Name | Department | Salary |
|---|---|---|---|
| 101 | Rahul | IT | 50000 |
| 102 | Priya | HR | 45000 |
| 103 | Amit | Finance | 60000 |
| 104 | Sneha | IT | 55000 |
| 105 | Karan | HR | 40000 |

## 2. Filtering with Comparison Operators

SQL provides comparison operators to filter records.

### Equal to (`=`)

```sql
SELECT *
FROM Employees
WHERE Department = 'IT';
```

Returns employees working in the IT department.

### Not equal to (`!=` or `<>`)

```sql
SELECT *
FROM Employees
WHERE Department <> 'HR';
```

Returns employees who are not in HR.

### Greater than (`>`)

```sql
SELECT *
FROM Employees
WHERE Salary > 50000;
```

### Less than (`<`)

```sql
SELECT *
FROM Employees
WHERE Salary < 50000;
```

### Greater than or equal to (`>=`)

```sql
SELECT *
FROM Employees
WHERE Salary >= 50000;
```

### Less than or equal to (`<=`)

```sql
SELECT *
FROM Employees
WHERE Salary <= 50000;
```

## 3. Using AND Operator

The `AND` operator returns records only when all conditions are true.

```sql
SELECT *
FROM Employees
WHERE Department = 'IT'
AND Salary > 50000;
```

Both conditions must be satisfied.

## 4. Using OR Operator

The `OR` operator returns records when at least one condition is true.

```sql
SELECT *
FROM Employees
WHERE Department = 'IT'
OR Department = 'HR';
```

Returns employees from either IT or HR.

## 5. Using NOT Operator

The `NOT` operator reverses a condition.

```sql
SELECT *
FROM Employees
WHERE NOT Department = 'IT';
```

Returns employees who are not in IT.

## 6. Using BETWEEN Operator

`BETWEEN` filters values within an inclusive range.

```sql
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 55000;
```

This includes salaries of both 40000 and 55000.

> **Important:** `BETWEEN` includes both boundary values.

## 7. Using IN Operator

`IN` checks whether a value matches any value in a specified list.

```sql
SELECT *
FROM Employees
WHERE Department IN ('IT', 'HR');
```

This is a cleaner alternative to multiple OR conditions.

## 8. Using LIKE Operator

`LIKE` is used for pattern matching in text columns.

Common wildcards:
- `%` — Matches zero or more characters.
- `_` — Matches exactly one character.

### Names starting with A:

```sql
SELECT *
FROM Employees
WHERE Name LIKE 'A%';
```

### Names ending with a:

```sql
SELECT *
FROM Employees
WHERE Name LIKE '%a';
```

### Names containing 'it':

```sql
SELECT *
FROM Employees
WHERE Name LIKE '%it%';
```

### Names with exactly five characters:

```sql
SELECT *
FROM Employees
WHERE Name LIKE '_____';
```

## 9. Using IS NULL

`NULL` represents missing or unknown data.

### To find records where a column contains NULL:

```sql
SELECT *
FROM Employees
WHERE Department IS NULL;
```

### To find records where the department is not NULL:

```sql
SELECT *
FROM Employees
WHERE Department IS NOT NULL;
```

> **Never use `= NULL` or `!= NULL` to check for NULL values. Use `IS NULL` or `IS NOT NULL`.**

## 10. Combining Multiple Conditions

You can combine `AND`, `OR`, and `NOT` to build more complex filters.

```sql
SELECT *
FROM Employees
WHERE Department = 'IT'
AND Salary > 45000
AND Name LIKE 'S%';
```

This retrieves IT employees earning more than 45000 whose names start with S.

Use parentheses when combining `AND` and `OR` to make the intended logic clear.

```sql
SELECT *
FROM Employees
WHERE (Department = 'IT' OR Department = 'HR')
AND Salary > 40000;
```

## 11. WHERE vs HAVING

Both are used for filtering, but they work at different stages.

| WHERE | HAVING |
|---|---|
| Filters individual rows | Filters grouped results |
| Applied before `GROUP BY` | Applied after `GROUP BY` |
| Cannot directly filter aggregate results | Can filter aggregate results |

**Example:**

```sql
SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 45000;
```

We'll explore `GROUP BY` and `HAVING` in detail later.

## 12. Real-World Banking Example

Suppose your manager asks: "Find all customers who have a balance greater than ₹1,00,000 and belong to Mumbai."

```sql
SELECT *
FROM Customers
WHERE Balance > 100000
AND City = 'Mumbai';
```

This retrieves only customers matching both conditions.

## 🔑 Key Takeaways

- `WHERE` filters rows based on conditions.
- Comparison operators help compare values.
- `AND` requires all conditions to be true.
- `OR` requires at least one condition to be true.
- `BETWEEN` filters an inclusive range.
- `IN` checks multiple possible values.
- `LIKE` performs pattern matching.
- `IS NULL` checks missing values.
- `WHERE` filters rows, while `HAVING` filters grouped results.

---

📌 *Double Tap ❤️ For More*