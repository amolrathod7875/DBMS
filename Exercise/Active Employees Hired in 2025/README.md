# Active Employees Hired in 2025

## Overview

This exercise demonstrates how to filter records using date ranges with the `BETWEEN` operator, combine multiple conditions with `AND`, and sort results chronologically using `ORDER BY`.

## Learning Objectives

- Master date filtering with `BETWEEN` for inclusive ranges
- Combine multiple WHERE conditions using `AND`
- Sort results chronologically with `ORDER BY`
- Understand inclusive date range boundaries

## Schema

### ER Diagram (Simple Text Format)

**Employee Table**

```
+-------------------------------------------+
|              Employees                    |
+-------------------------------------------+
| employee_id (PK)                         |
| employee_name                            |
| department_id (FK) -> Departments        |
| salary                                   |
| hire_date                                |
| manager_id (FK)                          |
| employment_status                        |
+-------------------------------------------+
```

**Relationship**
- Single table query (no joins required)

### Tables Structure

**employees**
- `employee_id`: Primary Key
- `employee_name`: Employee name
- `department_id`: Foreign Key to departments
- `salary`: Employee salary
- `hire_date`: Date of hire
- `manager_id`: Foreign Key to employees (self-referencing)
- `employment_status`: 'active' or 'inactive'

## Query Solution

### Problem

Find active employees whose hire dates fall in calendar year 2025. Display `employee_name`, `hire_date`; sort chronologically by hire date.

### Solution

```sql
SELECT employee_name, hire_date 
FROM employees
WHERE employment_status = 'active' 
  AND hire_date BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY hire_date ASC;
```

## Expected Results

The query returns 3 employees:

| employee_name | hire_date  |
|---------------|------------|
| Amol          | 2025-01-15 |
| Sneha         | 2025-07-12 |
| Meera         | 2025-09-09 |

Note: Arjun is excluded because employment_status is 'inactive'.

## Important Notes

1. **BETWEEN is inclusive**: Both '2025-01-01' and '2025-12-31' are included in the range
2. **AND operator**: Both conditions must be true — employment_status must be 'active' AND hire_date must be in 2025
3. **ORDER BY hire_date ASC**: Sorts results chronologically from earliest to latest hire date
4. **Single WHERE clause**: Multiple conditions are combined with AND within one WHERE clause

## Interview Questions

### Question 1
**When is `hire_date >= ... AND hire_date < ...` better than BETWEEN?**

**Answer:** When the column contains timestamps (not just dates), using `>= '2025-01-01' AND < '2026-01-01'` is safer because it includes the entire last day regardless of the time component. `BETWEEN '2025-01-01' AND '2025-12-31'` might miss records on December 31 after midnight.

### Question 2
**What does BETWEEN do in SQL?**

**Answer:** BETWEEN filters values within an inclusive range. `BETWEEN 40000 AND 55000` includes both 40000 and 55000, equivalent to `>= 40000 AND <= 55000`.

### Question 3
**Can you use multiple WHERE clauses in a single query?**

**Answer:** No. SQL only allows one WHERE clause per query. Multiple conditions must be combined using AND or OR within that single WHERE clause.

### Question 4
**What happens if you use OR instead of AND in this query?**

**Answer:** Using OR would return employees who are either active OR hired in 2025, which would include inactive employees hired in 2025 and active employees hired in any year. AND requires both conditions to be true.

### Question 5
**How would you find employees hired in 2025 or 2026?**

**Answer:** Use BETWEEN with the full range or IN operator:
```sql
WHERE hire_date BETWEEN '2025-01-01' AND '2026-12-31'
-- or
WHERE YEAR(hire_date) IN (2025, 2026)
```