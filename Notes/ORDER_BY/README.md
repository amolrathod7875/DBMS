# Phase 3: SQL — Topic 39: ORDER BY Clause — Sorting Data in SQL 📊

The `ORDER BY` clause is used to sort query results based on one or more columns. You can arrange records in ascending or descending order.

## 1. Basic Syntax

```sql
SELECT column1, column2
FROM table_name
ORDER BY column_name ASC;
```

Consider this Employees table:

| Employee_ID | Name  | Department | Salary |
| ----------- | ----- | ---------- | ------ |
| 101         | Rahul | IT         | 50000  |
| 102         | Priya | HR         | 45000  |
| 103         | Amit  | Finance    | 60000  |
| 104         | Sneha | IT         | 55000  |
| 105         | Karan | HR         | 40000  |

## 2. ASC — Ascending Order

ASC sorts values from smallest to largest.

```sql
SELECT *
FROM Employees
ORDER BY Salary ASC;
```

**Output:**

| Name  | Salary |
| ----- | ------ |
| Karan | 40000  |
| Priya | 45000  |
| Rahul | 50000  |
| Sneha | 55000  |
| Amit  | 60000  |

> **Note:** ASC is the default sorting order if you don't specify ASC or DESC.

## 3. DESC — Descending Order

DESC sorts values from largest to smallest.

```sql
SELECT *
FROM Employees
ORDER BY Salary DESC;
```

**Output:**

| Name  | Salary |
| ----- | ------ |
| Amit  | 60000  |
| Sneha | 55000  |
| Rahul | 50000  |
| Priya | 45000  |
| Karan | 40000  |

This is useful when finding the highest salaries, largest transactions, or top-performing products.

## 4. Sorting by Multiple Columns

You can sort data using multiple columns.

```sql
SELECT *
FROM Employees
ORDER BY Department ASC, Salary DESC;
```

**How does it work?**
- First, sort employees by Department alphabetically.
- Within each department, sort employees by Salary from highest to lowest.

**Example:**

| Name  | Department | Salary |
| ----- | ---------- | ------ |
| Amit  | Finance    | 60000  |
| Priya | HR         | 45000  |
| Karan | HR         | 40000  |
| Sneha | IT         | 55000  |
| Rahul | IT         | 50000  |

## 5. Sorting Using Column Position

SQL also allows you to sort using the position of a column in the SELECT statement.

```sql
SELECT Name, Department, Salary
FROM Employees
ORDER BY 3 DESC;
```

Here, `3` refers to the third selected column, Salary.

This works in many SQL databases, but using column names is generally more readable and maintainable.

## 6. Sorting Using Column Aliases

You can also sort using aliases created in the SELECT statement.

```sql
SELECT
    Name,
    Salary * 12 AS Annual_Salary
FROM Employees
ORDER BY Annual_Salary DESC;
```

This sorts employees based on their annual salary.

## 7. ORDER BY with WHERE

You can combine filtering and sorting.

```sql
SELECT *
FROM Employees
WHERE Department = 'IT'
ORDER BY Salary DESC;
```

This retrieves IT employees and sorts them by salary from highest to lowest.

## 8. ORDER BY with LIMIT

This combination is frequently used in real-world SQL queries.

Example: Find the top 3 highest-paid employees.

```sql
SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 3;
```

**Output:**

| Name  | Salary |
| ----- | ------ |
| Amit  | 60000  |
| Sneha | 55000  |
| Rahul | 50000  |

For SQL Server:

```sql
SELECT TOP 3 *
FROM Employees
ORDER BY Salary DESC;
```

## 9. Sorting NULL Values

NULL values represent missing or unknown data. Their sorting position can vary between database systems.

Some databases support explicit NULL ordering:

```sql
SELECT *
FROM Employees
ORDER BY Salary DESC NULLS LAST;
```

This places NULL values at the end.

> **Important:** `NULLS FIRST` and `NULLS LAST` are not supported in exactly the same way by every SQL database.

## 10. Real-World Banking Example

Suppose your manager asks: "Find the top 5 customers with the highest account balances."

```sql
SELECT
    Customer_ID,
    Customer_Name,
    Account_Balance
FROM Customers
ORDER BY Account_Balance DESC
LIMIT 5;
```

This retrieves the five customers with the highest balances.

## 11. Common Mistakes

- Forgetting that ASC is the default order.
- Using ORDER BY before WHERE.
- Confusing ASC with DESC.
- Sorting by the wrong column position.
- Assuming NULL values always appear at the end.
- Using LIMIT without ORDER BY when a specific top-N result is required.

## 🔑 Key Takeaways

- `ORDER BY` sorts query results.
- `ASC` sorts in ascending order.
- `DESC` sorts in descending order.
- Multiple columns can be used for sorting.
- You can sort using aliases.
- `WHERE` filters records before sorting.
- `ORDER BY` combined with `LIMIT` is useful for top-N analysis.

---

📌 *Double Tap ❤️ For More*