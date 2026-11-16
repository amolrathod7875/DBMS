# Top 3 Most Expensive Products

## Overview

This exercise demonstrates how to retrieve the top N records from a table using `ORDER BY` with `DESC` sorting and the `LIMIT` clause.

## Learning Objectives

- Master `ORDER BY` clause for sorting data
- Understand `DESC` (descending) sort order
- Use `LIMIT` to restrict the number of rows returned
- Combine `ORDER BY` and `LIMIT` for Top-N analysis

## Schema

### ER Diagram (Simple Text Format)

**Product Table**

```
+-----------------------------------+
|            Products               |
+-----------------------------------+
| product_id (PK)                   |
| product_name                      |
| category                          |
| price                             |
| stock                             |
+-----------------------------------+
```

**Relationship**
- Single table query (no joins required)

### Tables Structure

**products**
- `product_id`: Primary Key
- `product_name`: Product name
- `category`: Product category (Electronics, Stationery, Furniture)
- `price`: Product price
- `stock`: Available stock quantity

## Query Solution

### Problem

Find the three most expensive products. Display `product_name`, `price`; sort by price descending.

### Solution

```sql
SELECT product_name, price 
FROM products
ORDER BY price DESC
LIMIT 3;
```

## Expected Results

The query returns 3 products:

| product_name | price  |
|--------------|--------|
| Laptop       | 65000  |
| Monitor      | 15000  |
| Desk         | 8500   |

Note: Products are sorted from highest to lowest price. Only the top 3 are displayed.

## Important Notes

1. **ORDER BY price DESC**: Sorts products from most expensive to least expensive
2. **LIMIT 3**: Restricts the result to only 3 rows
3. **Top-N Analysis**: This pattern (ORDER BY + LIMIT) is commonly used for finding top performers, highest values, etc.
4. **Column selection**: Only `product_name` and `price` are displayed as requested

## Interview Questions

### Question 1
**What happens if two products have the same price?**

**Answer:** The database may return either product first. To get deterministic results, add a secondary sort column: `ORDER BY price DESC, product_id ASC`.

### Question 2
**What is the difference between `LIMIT` and `OFFSET`?**

**Answer:** `LIMIT` restricts the number of rows returned. `OFFSET` skips a specified number of rows before returning results. Together they enable pagination: `LIMIT 10 OFFSET 20` returns rows 21-30.

### Question 3
**How would you get the top 3 products in SQL Server?**

**Answer:** SQL Server uses `TOP` instead of `LIMIT`:
```sql
SELECT TOP 3 product_name, price 
FROM products
ORDER BY price DESC;
```

### Question 4
**What is the difference between ORDER BY with ASC and DESC?**

**Answer:** `ASC` (ascending) sorts from smallest to largest (default). `DESC` (descending) sorts from largest to smallest. For finding the most expensive products, we use `DESC`.

### Question 5
**Why is LIMIT placed after ORDER BY?**

**Answer:** SQL's logical execution order processes ORDER BY first (sorting the data), then LIMIT (restricting the number of rows). Placing LIMIT before ORDER BY would be syntactically incorrect.