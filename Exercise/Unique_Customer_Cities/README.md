# Unique Customer Cities

## Overview
This exercise demonstrates how to retrieve distinct values from a column using SQL's `DISTINCT` keyword and sort them alphabetically.

## Learning Objectives
- Master SQL SELECT DISTINCT for retrieving unique values
- Understand how DISTINCT eliminates duplicate rows
- Apply ORDER BY for alphabetical sorting
- Recognize when DISTINCT is preferred over GROUP BY

## Schema

### ER Diagram (Simple Text Format)

**Customer Table**
```
+-----------------------------------+
|            Customers              |
+-----------------------------------+
| customer_id (PK)                  |
| customer_name                     |
| city                              |
| signup_date                       |
+-----------------------------------+
```

**Relationship**
- Single table query (no joins required)

### Tables Structure

**customers**
- `customer_id`: Primary Key
- `customer_name`: Customer name
- `city`: City where customer registered
- `signup_date`: Date of customer signup

## Query Solution

### Problem
List all different cities from which customers have registered. Display `city`; sort alphabetically.

### Solution
```sql
SELECT DISTINCT city 
FROM customers 
ORDER BY city ASC;
```

## Expected Results
The query returns 5 unique cities:

| city |
|------|
| Bengaluru |
| Delhi |
| Hyderabad |
| Mumbai |
| Pune |

**Note:** Pune appears 3 times in customer records (Alice, Chitra, Farhan), but DISTINCT returns it only once. Mumbai appears 2 times (Bob, Harsh), but DISTINCT returns it only once.

## Important Notes
1. **DISTINCT keyword**: Eliminates duplicate values from the result set
2. **ORDER BY**: Sorts the distinct results alphabetically in ascending order
3. **Single column**: Returns only the `city` column as requested
4. **No joins needed**: Simple single-table query

## Interview Questions

### Question 1
**What does `SELECT DISTINCT city FROM customers` do?**

**Answer:** It returns only unique (non-duplicate) values from the `city` column. Even if multiple customers are from the same city, that city appears only once in the result set.

### Question 2
**How does DISTINCT differ from GROUP BY?**

**Answer:** 
- **DISTINCT**: Simply removes duplicate rows from the result set. It's a simpler operation that returns unique combinations of the selected columns.
- **GROUP BY**: Groups rows that have the same values into summary rows. It's used with aggregate functions (COUNT, SUM, AVG, etc.) to perform calculations on each group. GROUP BY can be used without aggregates, but it's less efficient than DISTINCT for simple deduplication.

### Question 3
**What happens if you use `SELECT DISTINCT city, customer_name` instead?**

**Answer:** DISTINCT would return unique combinations of both `city` and `customer_name`. Since each customer name is typically unique, you'd get all customers with their cities, not just unique cities. The result would be similar to a regular SELECT without DISTINCT.

### Question 4
**Can you use DISTINCT with multiple columns?**

**Answer:** Yes, `SELECT DISTINCT city, customer_name` returns unique combinations of city and customer_name. `SELECT DISTINCT city, customer_name, signup_date` returns unique combinations of all three columns. DISTINCT applies to the entire selected row, not individual columns.

### Question 5
**How would you modify the query to get the count of customers per city?**

**Answer:** Use GROUP BY with COUNT:
```sql
SELECT city, COUNT(*) AS customer_count 
FROM customers 
GROUP BY city 
ORDER BY city ASC;
```
This returns each city along with the number of customers registered from that city.