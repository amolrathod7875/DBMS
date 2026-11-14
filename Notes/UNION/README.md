# Phase 3: SQL for Data Science — Topic 10: UNION and UNION ALL

In this lesson, we'll learn how to combine data from multiple tables using `UNION` and `UNION ALL`.

## 1. What is UNION in SQL?

`UNION` is used to combine the results of two or more SELECT queries into a single result. It combines rows vertically, meaning one result is added below another.

For example, imagine you have two tables containing customer information.

**Table 1: customers_2025**
- 101: Alice
- 102: Bob

**Table 2: customers_2026**
- 103: Charlie
- 102: Bob

You want to combine customers from both tables.

```sql
SELECT customer_id, name
FROM customers_2025

UNION

SELECT customer_id, name
FROM customers_2026;
```

Result:
- 101: Alice
- 102: Bob
- 103: Charlie

Notice that Bob appears only once. Because `UNION` automatically removes duplicate rows.

## 2. What is UNION ALL?

`UNION ALL` also combines results from multiple SELECT queries. However, it does not remove duplicates.

Example with `UNION ALL`:
- 101: Alice
- 102: Bob
- 103: Charlie
- 102: Bob

Bob appears twice because `UNION ALL` keeps duplicate rows.

## 3. Difference Between UNION and UNION ALL

| Feature | UNION | UNION ALL |
|---|---|---|
| Removes duplicate rows | Yes | No |
| Performs duplicate elimination | Yes | No |
| Processing cost | Higher (duplicate check) | Lower (no duplicate check) |
| Use case | Unique results | All records needed |

**Important:** Prefer `UNION ALL` when you need every record and don't need duplicate removal.

## 4. Rules of UNION

There are some important rules you must follow when using UNION.

### Rule 1: Same number of columns

Both SELECT statements must return the same number of columns.

**Correct:**
```sql
SELECT customer_id, name
FROM customers_2025

UNION

SELECT customer_id, name
FROM customers_2026;
```

**Incorrect:**
```sql
SELECT customer_id, name
FROM customers_2025

UNION

SELECT customer_id
FROM customers_2026;
```

The second query has only one column.

### Rule 2: Columns must have compatible data types

The corresponding columns should have compatible data types. For example, combining an integer column with another integer column is valid.

### Rule 3: Column order matters

SQL combines columns based on their position, not their names.

```sql
SELECT customer_id, name
FROM customers_2025

UNION

SELECT name, customer_id
FROM customers_2026;
```

This is incorrect if the corresponding data types are incompatible.

### Rule 4: ORDER BY is generally placed at the end

```sql
SELECT customer_id, name
FROM customers_2025

UNION

SELECT customer_id, name
FROM customers_2026

ORDER BY customer_id;
```

This sorts the final combined result.

## 5. Using WHERE with UNION

You can filter records separately in each SELECT query.

Get customers from Pune from both tables:

```sql
SELECT customer_id, name, city
FROM customers_2025
WHERE city = 'Pune'

UNION

SELECT customer_id, name, city
FROM customers_2026
WHERE city = 'Pune';
```

Each SELECT applies its own filtering condition before the results are combined.

## 6. UNION with Different Tables

You don't need to combine only tables with the same name or structure. You can combine data from different tables as long as the number and types of corresponding columns are compatible.

Suppose you have:
- `online_orders`
- `store_orders`

Both contain order ID, customer ID, and order amount.

```sql
SELECT order_id, customer_id, amount
FROM online_orders

UNION ALL

SELECT order_id, customer_id, amount
FROM store_orders;
```

This combines online and physical store orders into one result.

## 7. UNION vs JOIN

This is a very important SQL interview concept.

- **UNION** combines rows vertically.
- **JOIN** combines columns horizontally by matching related records.

- **UNION:** Combine customer records from two different tables.
- **JOIN:** Combine customer details with their order details using customer ID.

## 8. Real-World Data Science Use Cases

UNION and UNION ALL are useful in many data analysis tasks:
- Combining monthly sales data from different tables.
- Merging customer records from different regions.
- Combining online and offline transactions.
- Consolidating historical and current records.
- Creating a unified dataset for reporting.
- Combining data collected from different sources.

**Example:** Combining sales from three regions.

```sql
SELECT product_id, sales
FROM north_sales

UNION ALL

SELECT product_id, sales
FROM south_sales

UNION ALL

SELECT product_id, sales
FROM west_sales;
```

This creates one combined sales dataset.

## 9. Common Mistakes to Avoid

- Using different numbers of columns in SELECT statements.
- Combining incompatible data types.
- Forgetting that UNION removes duplicate rows.
- Assuming UNION matches columns by their names.
- Using ORDER BY between individual SELECT statements instead of at the end.
- Using UNION when UNION ALL is sufficient, causing unnecessary duplicate elimination.

## 10. Interview Questions

**Q1. What is UNION in SQL?**

UNION combines the results of multiple SELECT statements and removes duplicate rows.

**Q2. What is UNION ALL?**

UNION ALL combines results while keeping duplicate rows.

**Q3. Which is generally faster: UNION or UNION ALL?**

UNION ALL is generally faster because it does not perform duplicate elimination.

**Q4. Can UNION combine more than two SELECT statements?**

Yes. You can combine multiple SELECT statements using UNION or UNION ALL.

**Q5. Does UNION require the same column names?**

No. It requires the same number of columns with compatible data types in corresponding positions.

## Practice Questions

1. Create a query to combine customer records from two tables using UNION.
2. Combine two sales tables using UNION ALL.
3. Combine employee records from three different regional tables.
4. Find unique product IDs from two product tables using UNION.
5. Combine online and offline orders while keeping duplicate records.

## Key Takeaways

- UNION combines results vertically.
- UNION removes duplicate rows.
- UNION ALL keeps duplicate rows.
- Both require the same number of columns.
- Corresponding columns must have compatible data types.
- UNION and JOIN serve different purposes.
- UNION ALL is generally faster when duplicates don't need to be removed.

---

📍 *Double Tap ❤️ For More*