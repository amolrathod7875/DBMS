# Phase 3: SQL for Data Science — Topic 9: SQL JOINS

In real-world data analysis, information is often stored across multiple tables. For example:

- customers
- orders
- products
- payments
- transactions

If you want the customer's name along with their order amount, you need to combine these tables. This is where JOINS are used.

## What is a JOIN?

A JOIN combines rows from two or more tables using a related column.

For example:

```sql
SELECT customers.customer_name, orders.amount
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id;
```

Result:

| customer_name | amount |
|---|---|
| Alice | 500 |
| Bob | 800 |
| Alice | 300 |

The common column here is `customer_id`.

## Why Are JOINS Important?

Data in real organizations is rarely stored in one giant table. You might have:

```
Customers
    ↓
Orders
    ↓
Products
    ↓
Payments
    ↓
Transactions
```

A Data Scientist or Data Analyst needs to combine these datasets to answer business questions.

Examples:
- Which customers placed orders?
- What products did customers purchase?
- Which regions generated the most revenue?
- Which customers have never placed an order?
- What is the average order value by customer segment?

## Main Types of JOINS

The most important SQL joins are:

1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL OUTER JOIN
5. CROSS JOIN
6. SELF JOIN

The first two are especially important for Data Science and Analytics.

## 1. INNER JOIN

INNER JOIN returns only rows that have a matching value in both tables.

**Example:**

customers:

| customer_id | name |
|---|---|
| 101 | Alice |
| 102 | Bob |
| 103 | Carol |

orders:

| order_id | customer_id |
|---|---|
| 1 | 101 |
| 2 | 102 |
| 3 | 104 |

```sql
SELECT c.customer_id,
       c.name,
       o.order_id
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;
```

Result:

| customer_id | name | order_id |
|---|---|---|
| 101 | Alice | 1 |
| 102 | Bob | 2 |

Customer 103 has no matching order. Customer 104 doesn't exist in the customers table. Therefore, neither appears in the result.

**Simple rule:** INNER JOIN → Only matching records

## 2. LEFT JOIN

LEFT JOIN returns:
- All rows from the left table
- Matching rows from the right table

If there is no match, the right-side columns contain NULL.

```sql
SELECT c.customer_id,
       c.name,
       o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
```

Result:

| customer_id | name | order_id |
|---|---|---|
| 101 | Alice | 1 |
| 102 | Bob | 2 |
| 103 | Carol | NULL |

Carol appears because customers is the left table.

**Simple rule:** LEFT JOIN → Everything from left + matching data from right

### Finding Customers Without Orders

This is one of the most useful real-world patterns.

```sql
SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
```

This identifies customers who have never placed an order. This type of analysis can be useful for:
- Customer retention
- Marketing campaigns
- Customer segmentation
- Churn analysis

## 3. RIGHT JOIN

RIGHT JOIN is essentially the opposite perspective of a LEFT JOIN. It returns:
- All rows from the right table
- Matching rows from the left table

```sql
SELECT c.name,
       o.order_id
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;
```

If an order has no matching customer, the customer columns can contain NULL.

**Simple rule:** RIGHT JOIN → Everything from right + matching data from left

In practice, many analysts prefer rewriting a RIGHT JOIN as a LEFT JOIN by switching the table order because it can make queries easier to read.

## 4. FULL OUTER JOIN

FULL OUTER JOIN returns:
- Matching rows
- Unmatched rows from the left table
- Unmatched rows from the right table

```sql
SELECT c.customer_id,
       c.name,
       o.order_id
FROM customers c
FULL OUTER JOIN orders o
    ON c.customer_id = o.customer_id;
```

Conceptually:
```
Customers only
        +
Matching records
        +
Orders only
```

Not every SQL database supports FULL OUTER JOIN in the same way, so database-specific syntax matters.

## 5. CROSS JOIN

A CROSS JOIN produces every possible combination of rows between two tables.

Suppose:

colors:
```
Red
Blue
```

sizes:
```
Small
Large
```

Query:

```sql
SELECT color, size
FROM colors
CROSS JOIN sizes;
```

Result:
```
Red    Small
Red    Large
Blue   Small
Blue   Large
```

2 colors × 2 sizes = 4 combinations. This is called a Cartesian product.

Use it carefully because the number of rows can become very large.

## 6. SELF JOIN

A SELF JOIN joins a table to itself. This is useful when rows in the same table have relationships with other rows.

For example, an employee table:

| employee_id | employee_name | manager_id |
|---|---|---|
| 101 | Alice | NULL |
| 102 | Bob | 101 |
| 103 | Carol | 101 |

You can use a self join to display each employee and their manager:

```sql
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;
```

Result:

| employee | manager |
|---|---|
| Alice | NULL |
| Bob | Alice |
| Carol | Alice |

## JOIN Conditions with ON

The ON clause specifies how the tables should be connected.

```sql
ON customers.customer_id = orders.customer_id
```

This means: `customers.customer_id = orders.customer_id`. The two columns don't necessarily need to have the same name.

For example:
```sql
ON customers.id = orders.customer_id
```
can also be valid if those columns represent the same relationship.

## Using Table Aliases

Aliases make JOIN queries much easier to read.

Instead of:

```sql
SELECT customers.customer_name,
       orders.amount
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id;
```

You can write:

```sql
SELECT c.customer_name,
       o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;
```

Here:
- c → customers
- o → orders

## JOIN with WHERE

You can filter the joined result.

```sql
SELECT c.name,
       o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.amount > 1000;
```

This returns matching customers whose orders exceed 1000.

## JOIN with GROUP BY

You can also aggregate after joining.

Suppose you want total spending by customer:

```sql
SELECT c.customer_id,
       c.name,
       SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;
```

This is extremely common in analytics.

## Real-World Data Science Example

Imagine you have three tables: customers, orders, products. You want to calculate how much revenue each product generated.

```sql
SELECT p.product_name,
       SUM(o.quantity * o.price) AS revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
```

This combines:
```
Orders
   ↓
Products
   ↓
GROUP BY
   ↓
Revenue calculation
   ↓
ORDER BY
   ↓
Highest revenue first
```

This type of SQL is directly useful for preparing datasets for Data Science and business analysis.

## Common JOIN Mistakes

### Mistake 1 — Missing the JOIN condition

```sql
SELECT *
FROM customers
JOIN orders;
```

Unless intentionally using a CROSS JOIN, you normally need a relationship condition.

### Mistake 2 — Joining on the wrong column

Always identify the actual relationship between the tables. For example:

```
customers.customer_id
        ↕
orders.customer_id
```

### Mistake 3 — Unexpected duplicate rows

Suppose one customer has 10 orders. After joining, that customer may appear 10 times. This is not necessarily an error — the JOIN is representing the one-to-many relationship.

### Mistake 4 — Accidentally turning a LEFT JOIN into an INNER JOIN

Consider:

```sql
SELECT c.name, o.amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.amount > 1000;
```

The WHERE condition removes rows where o.amount is NULL, so customers without orders disappear. Understanding how filtering interacts with joins is very important.

## JOIN Cheat Sheet

| JOIN Type | Description |
|---|---|
| INNER JOIN | Matching rows from both tables |
| LEFT JOIN | All left rows + matching right rows |
| RIGHT JOIN | All right rows + matching left rows |
| FULL OUTER JOIN | All rows from both tables |
| CROSS JOIN | Every possible combination |
| SELF JOIN | A table joined with itself |

## Interview Questions

**1. What is a JOIN?**

A JOIN combines data from multiple tables using a related column or condition.

**2. What does INNER JOIN return?**

Only rows with matching values in both tables.

**3. What does LEFT JOIN return?**

All rows from the left table and matching rows from the right table.

**4. How do you find customers who have never placed an order?**

Use a LEFT JOIN and check for NULL on the right table:

```sql
SELECT c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
```

**5. Why can a JOIN produce duplicate-looking rows?**

Because of one-to-many or many-to-many relationships between tables.

## Practice Questions

1. Write an INNER JOIN to display customer names and their order IDs.
2. Write a LEFT JOIN to display all customers, including customers who have no orders.
3. Find customers who have never placed an order.
4. Calculate total spending for each customer using JOIN and SUM().
5. Join orders and products and calculate total revenue for each product.

## Key Takeaways

- JOIN combines data from multiple tables.
- INNER JOIN returns matching records.
- LEFT JOIN keeps every record from the left table.
- RIGHT JOIN keeps every record from the right table.
- FULL OUTER JOIN keeps records from both sides.
- CROSS JOIN creates every possible combination.
- SELF JOIN joins a table with itself.
- ON defines the relationship between tables.
- JOINs are fundamental for real-world Data Science and Analytics.

---

📍 *Double Tap ❤️ For More*