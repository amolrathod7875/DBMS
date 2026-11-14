# Phase 3: SQL — Topic 37: SELECT Statement — Retrieving Data from a Database 🔍

## 1. What is the SELECT Statement?

The `SELECT` statement is used to retrieve data from one or more database tables. It is one of the most frequently used SQL commands.

### Basic Syntax

```sql
SELECT column1, column2
FROM table_name;
```

**Example:** Suppose we have an Employees table.

| Employee_ID | Name  | Department | Salary |
| ----------- | ----- | ---------- | ------ |
| 101         | Rahul | IT         | 50000  |
| 102         | Priya | HR         | 45000  |
| 103         | Amit  | Finance    | 60000  |
| 104         | Sneha | IT         | 55000  |

## 2. Retrieve All Columns

Use `SELECT *` to retrieve all columns from a table.

```sql
SELECT *
FROM Employees;
```

The `*` symbol represents all columns.

## 3. Retrieve Specific Columns

You don't always need every column.

```sql
SELECT Name, Salary
FROM Employees;
```

**Output:**

| Name  | Salary |
| ----- | ------ |
| Rahul | 50000  |
| Priya | 45000  |
| Amit  | 60000  |
| Sneha | 55000  |

This retrieves only the `Name` and `Salary` columns.

## 4. Using DISTINCT

The `DISTINCT` keyword removes duplicate combinations from the query result.

**Example:**

```sql
SELECT DISTINCT Department
FROM Employees;
```

**Output:**

| Department |
| ---------- |
| IT         |
| HR         |
| Finance    |

Even though IT appears twice in the original table, it appears only once in the result.

> **Important:** `DISTINCT` applies to the combination of all selected columns.

```sql
SELECT DISTINCT Department, Salary
FROM Employees;
```

This returns unique Department-Salary combinations.

## 5. Using Column Aliases

Aliases allow you to give temporary, more readable names to columns in the output.

**Example:**

```sql
SELECT
    Name AS Employee_Name,
    Salary AS Monthly_Salary
FROM Employees;
```

**Output:**

| Employee_Name | Monthly_Salary |
| ------------- | -------------- |
| Rahul         | 50000          |
| Priya         | 45000          |
| Amit          | 60000          |
| Sneha         | 55000          |

`AS` is optional in many SQL databases.

## 6. Performing Calculations in SELECT

You can perform mathematical calculations directly inside a `SELECT` statement.

**Example:**

```sql
SELECT
    Name,
    Salary,
    Salary * 12 AS Annual_Salary
FROM Employees;
```

This calculates the annual salary for every employee.

**Output:**

| Name  | Salary | Annual_Salary |
| ----- | ------ | ------------- |
| Rahul | 50000  | 600000        |
| Priya | 45000  | 540000        |
| Amit  | 60000  | 720000        |
| Sneha | 55000  | 660000        |

Other mathematical operators include:
- `+` Addition
- `-` Subtraction
- `*` Multiplication
- `/` Division
- `%` Modulus (support varies by database)

## 7. Using SELECT with String Functions

SQL also allows you to manipulate text inside `SELECT` queries.

**Example:**

```sql
SELECT
    Name,
    UPPER(Name) AS Uppercase_Name,
    LOWER(Name) AS Lowercase_Name
FROM Employees;
```

Other commonly used string functions:
- `UPPER()` — Converts text to uppercase.
- `LOWER()` — Converts text to lowercase.
- `LENGTH()` — Returns the length of a string (function name varies by database).
- `CONCAT()` — Combines strings.
- `TRIM()` — Removes leading and trailing spaces.

## 8. Using SELECT with Aggregate Functions

Aggregate functions perform calculations across multiple rows.

**Example:**

```sql
SELECT
    COUNT(*) AS Total_Employees,
    SUM(Salary) AS Total_Salary,
    AVG(Salary) AS Average_Salary,
    MAX(Salary) AS Highest_Salary,
    MIN(Salary) AS Lowest_Salary
FROM Employees;
```

**Important aggregate functions:**

| Function | Purpose                        |
| -------- | ------------------------------ |
| COUNT()  | Counts rows or non-NULL values |
| SUM()    | Calculates total               |
| AVG()    | Calculates average             |
| MAX()    | Finds maximum                  |
| MIN()    | Finds minimum                  |

We'll explore these functions in detail later.

## 9. SELECT with LIMIT

The `LIMIT` clause restricts the number of rows returned.

**Example:**

```sql
SELECT *
FROM Employees
LIMIT 2;
```

This returns only two rows.

> **Note:** SQL Server uses `TOP` or `OFFSET FETCH` instead of `LIMIT`.

**SQL Server example:**

```sql
SELECT TOP 2 *
FROM Employees;
```

Without `ORDER BY`, the database does not guarantee which two rows will be returned.

## 10. Understanding SQL Query Execution

A simplified logical processing order for a basic `SELECT` query is:

```
FROM
  ↓
SELECT
  ↓
DISTINCT
  ↓
LIMIT
```

For a more complete query, the logical order is generally:

```
FROM / JOIN
      ↓
WHERE
      ↓
GROUP BY
      ↓
HAVING
      ↓
SELECT
      ↓
DISTINCT
      ↓
ORDER BY
      ↓
LIMIT / OFFSET
```

This is important because SQL's logical execution order is different from the order in which you write the clauses.

## 11. Real-World Use Case

Imagine you're working as a Data Analyst in a banking organization. Your manager asks: "Show me the names, departments, and annual salaries of all employees."

You can write:

```sql
SELECT
    Name,
    Department,
    Salary * 12 AS Annual_Salary
FROM Employees;
```

You have now retrieved the required information without exporting the entire database.

## 🔑 Key Takeaways

- `SELECT` retrieves data from database tables.
- `SELECT *` retrieves all columns.
- `DISTINCT` removes duplicate combinations.
- `AS` creates readable column aliases.
- You can perform calculations inside `SELECT`.
- Aggregate functions summarize data.
- `LIMIT` restricts the number of returned rows.
- Understanding SQL execution order is important for writing complex queries.

---

📌 *Double Tap ❤️ For More*