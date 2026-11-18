# Search Products by Name Prefix

## Overview

This exercise demonstrates how to use the `LIKE` operator with wildcards for pattern matching in SQL to find records where a column value starts with a specific letter.

## Learning Objectives

- Master the `LIKE` operator for pattern matching
- Understand wildcard characters (`%` and `_`)
- Filter text columns using SQL patterns
- Sort results alphabetically

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

Find products with names beginning with the letter M. Display `product_name`, `category`, and `price`; sort by product name.

### Solution

```sql
SELECT product_name, category, price 
FROM products
WHERE product_name LIKE 'M%'
ORDER BY product_name ASC;
```

## Expected Results

The query returns 2 products:

| product_name | category    | price |
|--------------|-------------|-------|
| Monitor      | Electronics | 15000 |
| Mouse        | Electronics | 800   |

Note: Products are sorted alphabetically by product name in ascending order.

## Important Notes

1. **LIKE 'M%'**: The `%` wildcard matches zero or more characters after 'M', so it finds all names starting with 'M'
2. **Pattern matching**: Uses SQL pattern matching instead of a manual list of names
3. **ORDER BY product_name ASC**: Sorts results alphabetically from A to Z
4. **Case sensitivity**: Pattern matching behavior may vary by database collation settings

## Common Mistakes

### Mistake 1: Using = instead of LIKE

```sql
-- WRONG: This only matches exactly 'M'
WHERE product_name = 'M'

-- CORRECT: This matches all names starting with 'M'
WHERE product_name LIKE 'M%'
```

### Mistake 2: Forgetting the wildcard

```sql
-- WRONG: This only matches exactly 'M'
WHERE product_name LIKE 'M'

-- CORRECT: The % wildcard matches any characters after 'M'
WHERE product_name LIKE 'M%'
```

### Mistake 3: Using single quotes incorrectly

```sql
-- In MySQL, use single quotes for string literals
WHERE product_name LIKE 'M%'   -- Correct
WHERE product_name LIKE "M%"   -- Works in MySQL but not standard SQL
```

## Interview Questions

### Question 1
**What do `%` and `_` mean in SQL LIKE?**

**Answer:** `%` matches zero or more characters. `_` matches exactly one character. For example, `LIKE 'M%'` matches any string starting with 'M', while `LIKE 'M_'` matches exactly two-character strings starting with 'M'.

### Question 2
**How would you find products with names containing 'it'?**

**Answer:** Use `%` on both sides: `WHERE product_name LIKE '%it%'`. This matches any product name containing 'it' anywhere in the string.

### Question 3
**How would you find products with exactly 5-character names?**

**Answer:** Use five underscores: `WHERE product_name LIKE '_____'`. Each `_` matches exactly one character.

### Question 4
**Is LIKE case-sensitive?**

**Answer:** It depends on the database and collation settings. In MySQL with default collation, LIKE is case-insensitive. In PostgreSQL, LIKE is case-sensitive by default; use ILIKE for case-insensitive matching.

### Question 5
**What is the difference between LIKE and REGEXP?**

**Answer:** LIKE supports simple wildcard patterns (`%` and `_`). REGEXP (or RLIKE in MySQL) supports full regular expressions for more complex pattern matching.