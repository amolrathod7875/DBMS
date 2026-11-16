# SQL INTERVIEW PREPARATION — 42-DAY HANDS-ON CHALLENGE

**One SQL challenge every day • MySQL 8.0+ • Write the answers yourself • No solutions included.**

**Audience:** Python / AI–ML / GenAI / backend and software engineering interviews.
**Purpose:** Make SQL a practical skill alongside the 42-Day Python OOP challenge, DSA, and aptitude.
**Time:** 10–30 min initially, 25–55 min for intermediate exercises, up to 80 min for capstones. These are targets, not deadlines.

> **Important:** The questions depend on the synthetic starter database included in the companion file `SQL_Interview_Practice_Starter_MySQL8.sql`. It is intentionally not real company data. Re-run the starter file only if you want to reset the practice database—it drops and recreates its own practice tables.

## How to set up once

1. Install and start **MySQL Server 8.0+**, plus the **SQLTools** and **SQLTools MySQL/MariaDB driver** VS Code extensions (or use the MySQL CLI).
2. Open `SQL_Interview_Practice_Starter_MySQL8.sql` in VS Code and execute it on your **local practice MySQL server**, after checking that you are not connected to production. The script creates database `sql_interview_practice` and seeds synthetic records.
3. Verify there are **12 employees, 8 customers, 11 products, 15 orders, 26 order_items, 14 payments, 9 tickets and 9 ML runs**.
4. Create a GitHub repository such as `SQL-Interview-Practice`, keeping the roadmap and starter SQL file at the root.
5. For each day, create `Week-01/Day-01.sql` etc. Save your solution there. Run it and compare output with the pass checks below.
6. **Never commit passwords, `.env` files, connection profiles, or actual employer/customer records.** GitHub receives SQL source files, **not** the live MySQL database.

**Suggested repository layout**

```text
SQL-Interview-Practice/
├── README.md
├── SQL_Interview_Practice_42_Day_Roadmap.md
├── SQL_Interview_Practice_Starter_MySQL8.sql
├── Week-01/
├── Week-02/
├── Week-03/
├── Week-04/
├── Week-05/
└── Week-06/
    ├── Day-01.sql  # sample filename (number days continuously)
    └── ...
```

## Practice rules

- [ ] Spend 2–5 minutes sketching the tables and required output columns.
- [ ] Solve independently. Read the MySQL docs only if genuinely stuck; do not copy the completed solution.
- [ ] Run the query and match every pass check (including sorting, NULL, ties, and zero-count entities).
- [ ] Explain the join type / aggregation / time complexity or index implications in your own words.
- [ ] Add a short comment with your thinking to the day’s `.sql` file.
- [ ] Commit to GitHub. Mark the day complete only after verifying the output.

**Progress rule:** An empty checkbox means not completed. Check it only once the query actually works in MySQL. Expected results are supplied as tests, not as solutions.

## Database quick reference

| Table               | Useful columns                                                                                                             |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `departments`     | `department_id`, `department_name`                                                                                     |
| `employees`       | `employee_id`, `employee_name`, `department_id`, `salary`, `hire_date`, `manager_id`, `employment_status`    |
| `customers`       | `customer_id`, `customer_name`, `city`, `signup_date`                                                              |
| `products`        | `product_id`, `product_name`, `category`, `price`, `stock`                                                       |
| `orders`          | `order_id`, `customer_id`, `order_date`, `order_status`                                                            |
| `order_items`     | `order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`                                              |
| `payments`        | `payment_id`, `order_id`, `amount`, `paid_at`, `payment_method`, `payment_status`                              |
| `support_tickets` | `ticket_id`, `customer_id`, `assigned_employee_id`, `priority`, `ticket_status`, `created_at`, `resolved_at` |
| `model_runs`      | `run_id`, `model_name`, `dataset_name`, `accuracy`, `started_at`, `deployment_stage`                           |

**Business rule for these exercises:** Sales revenue is calculated from **delivered orders** using `order_items.quantity * order_items.unit_price`, unless a task explicitly says otherwise. Pending and cancelled orders are excluded from recognized revenue. Payment status is a separate concept.

## 42-day progress overview

| Day | Challenge                                  | Level        | Done |
| --: | ------------------------------------------ | ------------ | :--: |
|  01 | AI Department Salary Filter                | Easy         |  ☐  |
|  02 | Unique Customer Cities                     | Easy         |  ☐  |
|  03 | Top 3 Most Expensive Products              | Easy         |  ✅  |
|  04 | Active Employees Hired in 2025             | Easy         |  ✅  |
|  05 | Search Products by Name Prefix             | Easy         |  ☐  |
|  06 | Orders That Need Attention                 | Easy         |  ☐  |
|  07 | Product Stock Labels                       | Easy         |  ☐  |
|  08 | Employee Count per Department              | Easy         |  ☐  |
|  09 | Average Department Salary                  | Easy         |  ☐  |
|  10 | Salary Spread in Every Department          | Easy         |  ☐  |
|  11 | Order Counts Including New Customers       | Easy–Medium |  ☐  |
|  12 | Calculate Each Order Total                 | Easy–Medium |  ☐  |
|  13 | Revenue by Customer City                   | Medium       |  ☐  |
|  14 | Popular Products With HAVING               | Medium       |  ☐  |
|  15 | Employee Department Directory              | Easy         |  ☐  |
|  16 | Manager and Direct Report Names            | Medium       |  ☐  |
|  17 | Customers Who Never Ordered                | Easy–Medium |  ☐  |
|  18 | Paid Orders With Customer Names            | Medium       |  ☐  |
|  19 | Order Line Item Report                     | Medium       |  ☐  |
|  20 | Orders Without a Successful Payment        | Medium       |  ☐  |
|  21 | Top Customers by Delivered Revenue         | Medium       |  ☐  |
|  22 | Employees Earning Above Department Average | Medium       |  ☐  |
|  23 | Customers With a Delivered Order           | Easy–Medium |  ☐  |
|  24 | Classify Orders by Monetary Value          | Medium       |  ☐  |
|  25 | Large Delivered Orders Using a CTE         | Medium       |  ☐  |
|  26 | Customers With Open Tickets                | Medium       |  ☐  |
|  27 | Products Never Sold in a Delivered Order   | Medium       |  ☐  |
|  28 | Support Agent Ticket Scorecard             | Medium       |  ☐  |
|  29 | Employee Row Numbers by Department         | Medium       |  ☐  |
|  30 | Salary Ranks With Ties                     | Medium       |  ☐  |
|  31 | Days Between a Customer’s Orders          | Medium       |  ☐  |
|  32 | Running Total of Delivered Revenue         | Medium       |  ☐  |
|  33 | Top Two Products per Category              | Medium–Hard |  ☐  |
|  34 | Month-over-Month Revenue Growth            | Medium–Hard |  ☐  |
|  35 | Latest ML Run per Dataset                  | Medium       |  ☐  |
|  36 | Create a Constrained Subscriptions Table   | Medium       |  ☐  |
|  37 | Safe Inventory Update in a Transaction     | Medium       |  ☐  |
|  38 | Atomic Wallet Transfer                     | Medium–Hard |  ☐  |
|  39 | Investigate a Query With EXPLAIN           | Medium       |  ☐  |
|  40 | Recursive Management Hierarchy             | Hard         |  ☐  |
|  41 | Best Deployed ML Model per Dataset         | Medium–Hard |  ☐  |
|  42 | Final SQL Analytics Capstone               | Hard         |  ☐  |

---

## Week 1 — Basic Retrieval and Filtering

**This week’s focus:** SELECT, WHERE, DISTINCT, ORDER BY, LIMIT, dates, LIKE, CASE.

### DAY 01 — AI Department Salary Filter

**Level:** Easy  |  **Target:** 15–20 minutes  |  **Concepts:** SELECT, WHERE, AND, ORDER BY

**Challenge:** Find active employees in the AI department earning more than 60,000. Display `employee_name`, `salary`; sort from highest to lowest.

**Tasks**

- [X] Use the `employees` and `departments` tables.
- [X] Show exactly two columns, in the requested order.
- [X] Use the department name (not a hardcoded department ID).

**Pass checks**

- [X] Result has 3 employees: Neha, Priya, Amol (in that order).
- [X] Rohan is excluded because salary is only 55,000.

**Interview reflection:** Why is `AND` required instead of `OR`?

**Save as:** `Week-01/Day-01.sql`  |  **Progress:** ☐ Not started

---

### DAY 02 — Unique Customer Cities

**Level:** Easy  |  **Target:** 10–15 minutes  |  **Concepts:** SELECT DISTINCT

**Challenge:** List all different cities from which customers have registered.

**Tasks**

- [X] Query `customers`; return one column named `city`.
- [X] Sort the distinct cities alphabetically.

**Pass checks**

- [X] Exactly 5 city names are returned.
- [X] `Pune` and `Mumbai` appear once each, despite multiple customers.

**Interview reflection:** How does DISTINCT differ from GROUP BY?

**Save as:** `Week-01/Day-02.sql`  |  **Progress:** ☐ Not started

---

### DAY 03 — Top 3 Most Expensive Products

**Level:** Easy  |  **Target:** 10–15 minutes  |  **Concepts:** ORDER BY, LIMIT

**Challenge:** Find the three most expensive products.

**Tasks**

- [X] Return `product_name`, `price`.
- [X] Order by price descending and use a row limit.

**Pass checks**

- [X] Order is Laptop (65000), Monitor (15000), Desk (8500).
- [X] Exactly 3 rows appear.

**Interview reflection:** What happens if two products have the same price?

**Save as:** `Week-01/Day-03.sql`  |  **Progress:** ✅ Completed

---

### DAY 04 — Active Employees Hired in 2025

**Level:** Easy  |  **Target:** 15–20 minutes  |  **Concepts:** BETWEEN, dates, AND

**Challenge:** Find active employees whose hire dates fall in calendar year 2025.

**Tasks**

- [X] Return `employee_name`, `hire_date`.
- [X] Use an inclusive range covering January 1 through December 31, 2025.
- [X] Sort chronologically by hire date.

**Pass checks**

- [X] Expected names: Amol, Sneha, Meera.
- [X] Arjun is excluded because employment_status is inactive.

**Interview reflection:** When is `hire_date >= ... AND hire_date < ...` better than BETWEEN?

**Save as:** `Week-01/Day-04.sql`  |  **Progress:** ✅ Completed

---

### DAY 05 — Search Products by Name Prefix

**Level:** Easy  |  **Target:** 10–15 minutes  |  **Concepts:** LIKE, pattern matching

**Challenge:** Find products with names beginning with the letter M.

**Tasks**

- [ ] Return `product_name`, `category`, and `price`.
- [ ] Use a SQL pattern, not a manual list of names.
- [ ] Sort by product name.

**Pass checks**

- [ ] Exactly Mouse and Monitor match.
- [ ] Products such as Webcam and Laptop do not match.

**Interview reflection:** What do `%` and `_` mean in SQL LIKE?

**Save as:** `Week-01/Day-05.sql`  |  **Progress:** ☐ Not started

---

### DAY 06 — Orders That Need Attention

**Level:** Easy  |  **Target:** 15–20 minutes  |  **Concepts:** IN, filtering, sorting

**Challenge:** List orders that are either pending or cancelled.

**Tasks**

- [ ] Return `order_id`, `order_date`, `order_status`.
- [ ] Use a single membership condition.
- [ ] Sort by date and then order ID ascending.

**Pass checks**

- [ ] Three order IDs: 403, 405, 407.
- [ ] No delivered orders appear.

**Interview reflection:** When is IN clearer than several OR comparisons?

**Save as:** `Week-01/Day-06.sql`  |  **Progress:** ☐ Not started

---

### DAY 07 — Product Stock Labels

**Level:** Easy  |  **Target:** 20–25 minutes  |  **Concepts:** CASE, conditional expressions

**Challenge:** Create a readable stock-status label without changing stored data.

**Tasks**

- [ ] Return `product_name`, `stock`, `stock_label`.
- [ ] `stock = 0` → Out of Stock; `stock` 1 through 9 → Low Stock; `stock >= 10` → In Stock.
- [ ] Sort by product_id.

**Pass checks**

- [ ] Headset is Out of Stock.
- [ ] Desk and Chair are Low Stock.
- [ ] Laptop is In Stock.

**Interview reflection:** What is the difference between a CASE expression and updating the underlying table?

**Save as:** `Week-01/Day-07.sql`  |  **Progress:** ☐ Not started

---

## Week 2 — Aggregation and Business Metrics

**This week’s focus:** COUNT, AVG, MIN/MAX, GROUP BY, HAVING, aggregate joins.

### DAY 08 — Employee Count per Department

**Level:** Easy  |  **Target:** 20–25 minutes  |  **Concepts:** COUNT, GROUP BY, LEFT JOIN

**Challenge:** Create a report of employee counts per department, including departments with zero employees.

**Tasks**

- [ ] Return `department_name` and `employee_count`.
- [ ] Count employees, including inactive employees.
- [ ] Sort department names alphabetically.

**Pass checks**

- [ ] AI has 4 employees; Engineering has 4.
- [ ] Sales has 2; HR and Finance have 1 each.

**Interview reflection:** Why does a LEFT JOIN matter when a department might have zero employees?

**Save as:** `Week-02/Day-08.sql`  |  **Progress:** ☐ Not started

---

### DAY 09 — Average Department Salary

**Level:** Easy  |  **Target:** 20–25 minutes  |  **Concepts:** AVG, ROUND, GROUP BY

**Challenge:** Find the average base salary in each department.

**Tasks**

- [ ] Return `department_name` and `avg_salary` rounded to two decimal places.
- [ ] Include active and inactive employees; sort by average descending.

**Pass checks**

- [ ] AI average is 85000.00; Engineering average is 73500.00.
- [ ] The highest average belongs to AI.

**Interview reflection:** Does AVG include NULL salary values, if they exist?

**Save as:** `Week-02/Day-09.sql`  |  **Progress:** ☐ Not started

---

### DAY 10 — Salary Spread in Every Department

**Level:** Easy  |  **Target:** 20–25 minutes  |  **Concepts:** MIN, MAX, arithmetic aggregates

**Challenge:** Measure salary variation within each department.

**Tasks**

- [ ] Return department name, minimum salary, maximum salary, and `salary_range = max - min`.
- [ ] Sort by largest salary_range first.

**Pass checks**

- [ ] AI range is 65000; Engineering range is 60000.
- [ ] A department with one employee has range zero.

**Interview reflection:** How is salary range different from variance and standard deviation?

**Save as:** `Week-02/Day-10.sql`  |  **Progress:** ☐ Not started

---

### DAY 11 — Order Counts Including New Customers

**Level:** Easy–Medium  |  **Target:** 25–30 minutes  |  **Concepts:** LEFT JOIN, COUNT, GROUP BY

**Challenge:** List every customer and how many orders they have placed, including customers with zero orders.

**Tasks**

- [ ] Return `customer_name`, `order_count`.
- [ ] Count orders of all statuses.
- [ ] Sort by descending count and alphabetically for ties.

**Pass checks**

- [ ] Gia has zero orders.
- [ ] Alice has 4 orders, and Bob has 3.

**Interview reflection:** Why can COUNT(*) give a misleading result after a LEFT JOIN?

**Save as:** `Week-02/Day-11.sql`  |  **Progress:** ☐ Not started

---

### DAY 12 — Calculate Each Order Total

**Level:** Easy–Medium  |  **Target:** 25–30 minutes  |  **Concepts:** SUM, multiplication, GROUP BY

**Challenge:** Calculate the total line-item value of each order.

**Tasks**

- [ ] Use `order_items.quantity * order_items.unit_price`.
- [ ] Return `order_id`, `order_total`; sort by order ID.
- [ ] Do not substitute current product prices for historical order item prices.

**Pass checks**

- [ ] Order 401 totals 66600.
- [ ] Order 405 totals 8500, even though it was cancelled.
- [ ] Order 415 totals 4000.

**Interview reflection:** Why should historic sales reports use unit_price from order_items rather than products.price?

**Save as:** `Week-02/Day-12.sql`  |  **Progress:** ☐ Not started

---

### DAY 13 — Revenue by Customer City

**Level:** Medium  |  **Target:** 35–45 minutes  |  **Concepts:** JOIN, SUM, GROUP BY, filtering

**Challenge:** Compute revenue from delivered orders for each city.

**Tasks**

- [ ] Use order items for revenue and only `orders.order_status = delivered`.
- [ ] Return `city`, `revenue`, including only cities with at least one delivered order.
- [ ] Sort by revenue descending.

**Pass checks**

- [ ] Pune revenue is 88800; Bengaluru revenue is 81400.
- [ ] Cancelled and pending orders add no revenue.

**Interview reflection:** How could an accidental join to multiple payments inflate revenue?

**Save as:** `Week-02/Day-13.sql`  |  **Progress:** ☐ Not started

---

### DAY 14 — Popular Products With HAVING

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** HAVING, SUM, JOIN

**Challenge:** Find products with more than three units sold in delivered orders.

**Tasks**

- [ ] Sum `quantity` from `order_items`, filtered to delivered orders.
- [ ] Return `product_name`, `units_sold`, ordered by units_sold descending.
- [ ] Apply the threshold to the group aggregate, not the raw row.

**Pass checks**

- [ ] Pen has 20 units; Notebook has 15.
- [ ] Mouse and Keyboard also pass; exactly 4 products qualify.

**Interview reflection:** Explain WHERE vs HAVING using this query.

**Save as:** `Week-02/Day-14.sql`  |  **Progress:** ☐ Not started

---

## Week 3 — Relational Joins

**This week’s focus:** INNER, LEFT, SELF, multi-table joins, anti-joins.

### DAY 15 — Employee Department Directory

**Level:** Easy  |  **Target:** 20–25 minutes  |  **Concepts:** INNER JOIN

**Challenge:** Produce a directory showing each employee and their department.

**Tasks**

- [ ] Return `employee_id`, `employee_name`, `department_name`.
- [ ] Include all 12 employees.
- [ ] Sort by employee_id.

**Pass checks**

- [ ] Employee 101 is Amol in AI.
- [ ] Employee 110 is Isha in Engineering.

**Interview reflection:** How would an employee with an invalid department reference affect INNER JOIN?

**Save as:** `Week-03/Day-15.sql`  |  **Progress:** ☐ Not started

---

### DAY 16 — Manager and Direct Report Names

**Level:** Medium  |  **Target:** 25–35 minutes  |  **Concepts:** SELF JOIN, aliases

**Challenge:** Show each employee next to their manager, if any.

**Tasks**

- [ ] Return `employee_name`, `manager_name`.
- [ ] Include top-level employees whose manager is NULL.
- [ ] Sort by employee_id and represent missing manager names as NULL.

**Pass checks**

- [ ] Rahul reports to Vikram.
- [ ] Rohan reports to Priya.
- [ ] Neha has no manager.

**Interview reflection:** Why do both instances of employees need different aliases?

**Save as:** `Week-03/Day-16.sql`  |  **Progress:** ☐ Not started

---

### DAY 17 — Customers Who Never Ordered

**Level:** Easy–Medium  |  **Target:** 20–30 minutes  |  **Concepts:** LEFT JOIN, IS NULL

**Challenge:** Find customers with no order records.

**Tasks**

- [ ] Return `customer_id`, `customer_name`.
- [ ] Use join logic to find unmatched customers; do not rely on memorized IDs.

**Pass checks**

- [ ] Only Gia appears.
- [ ] Farhan does not appear because he has a pending order.

**Interview reflection:** How does no orders differ from no delivered orders?

**Save as:** `Week-03/Day-17.sql`  |  **Progress:** ☐ Not started

---

### DAY 18 — Paid Orders With Customer Names

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** 3-table JOIN, filtering

**Challenge:** Create a list of successfully paid orders with customer names.

**Tasks**

- [ ] Join customers, orders, and payments.
- [ ] Return `order_id`, `customer_name`, `amount`, `payment_method`.
- [ ] Include only `payment_status = paid`; sort by order ID.

**Pass checks**

- [ ] 12 rows are returned.
- [ ] Order 405 (failed payment) is excluded.

**Interview reflection:** What assumptions are you making about one payment versus multiple payments per order?

**Save as:** `Week-03/Day-18.sql`  |  **Progress:** ☐ Not started

---

### DAY 19 — Order Line Item Report

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** MULTI-JOIN, computed columns

**Challenge:** Build an invoice-style line item listing for delivered order 401.

**Tasks**

- [ ] Return `order_id`, `product_name`, `quantity`, `unit_price`, and calculated `line_total`.
- [ ] Only show order 401 and sort by product_id.

**Pass checks**

- [ ] Laptop line = 65000 and Mouse line = 1600.
- [ ] Summing the line_total values gives 66600.

**Interview reflection:** Why is INNER JOIN the right choice for listing only valid line items?

**Save as:** `Week-03/Day-19.sql`  |  **Progress:** ☐ Not started

---

### DAY 20 — Orders Without a Successful Payment

**Level:** Medium  |  **Target:** 35–45 minutes  |  **Concepts:** NOT EXISTS or LEFT JOIN

**Challenge:** Find orders that do not have any payment marked paid.

**Tasks**

- [ ] Return `order_id`, `order_status`.
- [ ] Handle an order with no payment and an order with a failed/pending payment.
- [ ] Do not accidentally include orders with at least one successful payment.

**Pass checks**

- [ ] Orders 403, 405, and 407 qualify.
- [ ] Delivered order 401 does not qualify.

**Interview reflection:** When is NOT EXISTS safer than `NOT IN`?

**Save as:** `Week-03/Day-20.sql`  |  **Progress:** ☐ Not started

---

### DAY 21 — Top Customers by Delivered Revenue

**Level:** Medium  |  **Target:** 35–45 minutes  |  **Concepts:** GROUP BY, multi-table JOIN

**Challenge:** Rank customers by revenue from delivered orders.

**Tasks**

- [ ] Return `customer_name`, `revenue` for customers with at least one delivered order.
- [ ] Use order_items historical unit prices.
- [ ] Sort by revenue descending; add customer name as a tie-breaker.

**Pass checks**

- [ ] Esha is first with 81400; Alice is second with 75400.
- [ ] Do not count pending or cancelled orders.

**Interview reflection:** What causes double counting when joining two one-to-many tables?

**Save as:** `Week-03/Day-21.sql`  |  **Progress:** ☐ Not started

---

## Week 4 — Subqueries and CTEs

**This week’s focus:** Correlated subqueries, EXISTS, NOT EXISTS, CASE, CTEs.

### DAY 22 — Employees Earning Above Department Average

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** Correlated subquery

**Challenge:** Find employees whose salary exceeds the average salary within their own department.

**Tasks**

- [ ] Return `employee_name`, `department_name`, `salary`.
- [ ] Compare each employee against their own department average.
- [ ] Sort salary descending.

**Pass checks**

- [ ] Four employees qualify: Neha, Vikram, Priya, Kavya.
- [ ] No HR or Finance employee qualifies.

**Interview reflection:** How often might a correlated subquery be logically evaluated?

**Save as:** `Week-04/Day-22.sql`  |  **Progress:** ☐ Not started

---

### DAY 23 — Customers With a Delivered Order

**Level:** Easy–Medium  |  **Target:** 20–30 minutes  |  **Concepts:** EXISTS

**Challenge:** List customers who have at least one delivered order.

**Tasks**

- [ ] Return `customer_id`, `customer_name`.
- [ ] Do not return duplicate customer rows when they have many orders.
- [ ] Sort by customer_id.

**Pass checks**

- [ ] Five customers qualify.
- [ ] Danish, Farhan, and Gia do not qualify.

**Interview reflection:** Why is EXISTS useful when you only care about whether a related record is present?

**Save as:** `Week-04/Day-23.sql`  |  **Progress:** ☐ Not started

---

### DAY 24 — Classify Orders by Monetary Value

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** CTE, CASE, SUM

**Challenge:** Label each order High, Medium, or Small according to its calculated amount.

**Tasks**

- [ ] First calculate the order total from order_items.
- [ ] High: total >= 20000; Medium: 5000 <= total < 20000; Small: total < 5000.
- [ ] Return `order_id`, `order_total`, `value_tier`; include all statuses.

**Pass checks**

- [ ] Order 401 is High.
- [ ] Order 402 is Medium; order 403 is Small.

**Interview reflection:** Why must CASE checks be ordered carefully?

**Save as:** `Week-04/Day-24.sql`  |  **Progress:** ☐ Not started

---

### DAY 25 — Large Delivered Orders Using a CTE

**Level:** Medium  |  **Target:** 25–35 minutes  |  **Concepts:** WITH CTE, aggregate filters

**Challenge:** Find delivered orders with an order total greater than 20000.

**Tasks**

- [ ] Use a named CTE to compute order totals before filtering.
- [ ] Return `order_id`, `order_total`; sort by total descending.

**Pass checks**

- [ ] Exactly 3 orders qualify: 406, 401, and 409.
- [ ] No pending/cancelled order appears.

**Interview reflection:** What makes a CTE clearer than repeating the same aggregation?

**Save as:** `Week-04/Day-25.sql`  |  **Progress:** ☐ Not started

---

### DAY 26 — Customers With Open Tickets

**Level:** Medium  |  **Target:** 25–35 minutes  |  **Concepts:** EXISTS, subquery filters

**Challenge:** Find customers who have at least one currently open support ticket.

**Tasks**

- [ ] Return `customer_id`, `customer_name`.
- [ ] Only `ticket_status = open` qualifies; pending does not.
- [ ] Return each customer once.

**Pass checks**

- [ ] Alice, Bob, Farhan, and Harsh qualify.
- [ ] Chitra does not qualify.

**Interview reflection:** When might you choose EXISTS instead of INNER JOIN + DISTINCT?

**Save as:** `Week-04/Day-26.sql`  |  **Progress:** ☐ Not started

---

### DAY 27 — Products Never Sold in a Delivered Order

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** NOT EXISTS, anti-join

**Challenge:** Find products that never appear in any delivered order.

**Tasks**

- [ ] Return `product_id`, `product_name`.
- [ ] A product appearing only in a cancelled/pending order would still count as not sold.
- [ ] Do not confuse zero stock with never sold.

**Pass checks**

- [ ] USB-C Hub is the only product returned.
- [ ] Headset is not returned, even though its stock is zero.

**Interview reflection:** What edge case involving NULL can break a NOT IN version?

**Save as:** `Week-04/Day-27.sql`  |  **Progress:** ☐ Not started

---

### DAY 28 — Support Agent Ticket Scorecard

**Level:** Medium  |  **Target:** 35–45 minutes  |  **Concepts:** SUM(CASE), LEFT JOIN

**Challenge:** Show ticket status counts for every employee.

**Tasks**

- [ ] Return `employee_name`, `open_count`, `pending_count`, `resolved_count`.
- [ ] Include employees who have never been assigned a ticket, with zero counts.
- [ ] Count only tickets assigned to each employee; NULL assignments do not count for anyone.

**Pass checks**

- [ ] Amol has 3 resolved tickets.
- [ ] Isha has 1 open and 1 pending ticket.
- [ ] Neha has zeros for every count.

**Interview reflection:** Why does COUNT(*) behave differently from SUM(CASE ...) after an outer join?

**Save as:** `Week-04/Day-28.sql`  |  **Progress:** ☐ Not started

---

## Week 5 — Window Functions

**This week’s focus:** ROW_NUMBER, RANK, LAG, running totals, Top-N, growth.

### DAY 29 — Employee Row Numbers by Department

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** ROW_NUMBER, PARTITION BY

**Challenge:** Assign a unique salary-order position within each department.

**Tasks**

- [ ] Return `department_name`, `employee_name`, `salary`, `salary_position`.
- [ ] Order salaries descending within each department; break equal-salary ties by employee_id ascending.
- [ ] Do not collapse employees with equal salaries.

**Pass checks**

- [ ] Engineering contains four rows with positions 1–4.
- [ ] Isha is positioned before Meera for their equal 72000 salaries.

**Interview reflection:** How does ROW_NUMBER differ from RANK?

**Save as:** `Week-05/Day-29.sql`  |  **Progress:** ☐ Not started

---

### DAY 30 — Salary Ranks With Ties

**Level:** Medium  |  **Target:** 25–35 minutes  |  **Concepts:** DENSE_RANK, ties

**Challenge:** Rank salaries within each department while giving equal salaries the same rank.

**Tasks**

- [ ] Return `department_name`, `employee_name`, `salary`, `salary_rank`.
- [ ] Use DENSE_RANK partitioned by department, ordered by salary descending.

**Pass checks**

- [ ] Engineering: Vikram rank 1; Isha and Meera rank 2; Rahul rank 3.
- [ ] Ranks have no gaps after a tie.

**Interview reflection:** What rank would RANK assign to Rahul in this department?

**Save as:** `Week-05/Day-30.sql`  |  **Progress:** ☐ Not started

---

### DAY 31 — Days Between a Customer’s Orders

**Level:** Medium  |  **Target:** 35–45 minutes  |  **Concepts:** LAG, DATEDIFF

**Challenge:** For each customer, calculate days elapsed since their previous order.

**Tasks**

- [ ] Return `customer_name`, `order_id`, `order_date`, `previous_order_date`, `days_since_previous`.
- [ ] Include all statuses.
- [ ] Order each customer’s purchases chronologically by order_date, then order_id.

**Pass checks**

- [ ] Each customer’s first order has NULL previous date and NULL interval.
- [ ] Alice’s order 403 is 4 days after order 401.

**Interview reflection:** Why is LAG preferable to a self-join for this comparison?

**Save as:** `Week-05/Day-31.sql`  |  **Progress:** ☐ Not started

---

### DAY 32 — Running Total of Delivered Revenue

**Level:** Medium  |  **Target:** 35–45 minutes  |  **Concepts:** SUM OVER, window ordering

**Challenge:** Calculate cumulative revenue after every delivered order.

**Tasks**

- [ ] Calculate each delivered order’s total first.
- [ ] Order chronologically by order_date and order_id, then compute cumulative sum.
- [ ] Return `order_id`, `order_date`, `order_total`, `running_revenue`.

**Pass checks**

- [ ] The final cumulative revenue is 231700.
- [ ] The earliest delivered order is 413 (2026-09-04), not 401.

**Interview reflection:** Why should the window order include order_id as a deterministic tie-breaker?

**Save as:** `Week-05/Day-32.sql`  |  **Progress:** ☐ Not started

---

### DAY 33 — Top Two Products per Category

**Level:** Medium–Hard  |  **Target:** 35–50 minutes  |  **Concepts:** CTE, ROW_NUMBER, PARTITION BY

**Challenge:** For every product category, find its two highest revenue-generating products based on delivered orders.

**Tasks**

- [ ] Compute revenue per product; include never-sold products as revenue 0.
- [ ] Rank within each category by revenue descending, breaking ties by product_id.
- [ ] Return `category`, `product_name`, `revenue`, `position`; keep positions <= 2.

**Pass checks**

- [ ] Electronics top 2: Laptop, Monitor.
- [ ] Furniture top 2: Desk, Chair.
- [ ] Stationery top 2: Notebook, Pen.

**Interview reflection:** When should ROW_NUMBER be preferred over RANK for Top-N reports?

**Save as:** `Week-05/Day-33.sql`  |  **Progress:** ☐ Not started

---

### DAY 34 — Month-over-Month Revenue Growth

**Level:** Medium–Hard  |  **Target:** 40–55 minutes  |  **Concepts:** CTE, DATE_FORMAT, LAG

**Challenge:** Calculate delivered revenue for each month, plus percentage change from the previous month.

**Tasks**

- [ ] Group by calendar month using year and month together.
- [ ] Return `year_month`, `revenue`, `previous_month_revenue`, `growth_pct`.
- [ ] The first month has NULL previous revenue and growth; guard against division by zero.

**Pass checks**

- [ ] 2026-09 = 10500, 2026-10 = 217200, 2026-11 = 4000.
- [ ] October growth is about +1968.57%.

**Interview reflection:** Why might grouping by MONTH(order_date) without YEAR be wrong?

**Save as:** `Week-05/Day-34.sql`  |  **Progress:** ☐ Not started

---

### DAY 35 — Latest ML Run per Dataset

**Level:** Medium  |  **Target:** 30–40 minutes  |  **Concepts:** ROW_NUMBER, latest record per group

**Challenge:** Find the most recent ML experiment run for every dataset.

**Tasks**

- [ ] From `model_runs`, return `dataset_name`, `run_id`, `model_name`, `accuracy`, `started_at`, `deployment_stage`.
- [ ] Define most recent by started_at descending, with run_id descending as tie-breaker.

**Pass checks**

- [ ] Latest fraud_ds run is 703.
- [ ] Latest reviews run is 708; latest credit run is 709.

**Interview reflection:** Why is newest not necessarily the best-performing or production-ready model?

**Save as:** `Week-05/Day-35.sql`  |  **Progress:** ☐ Not started

---

## Week 6 — Production SQL and Interview Capstones

**This week’s focus:** Constraints, transactions, indexes, recursive CTEs, ML data, analytics.

### DAY 36 — Create a Constrained Subscriptions Table

**Level:** Medium  |  **Target:** 40–55 minutes  |  **Concepts:** CREATE TABLE, PK, FK, UNIQUE, CHECK

**Challenge:** Design one new table for customer subscription plans.

**Tasks**

- [ ] Create `subscriptions(subscription_id, customer_id, plan_name, monthly_fee, started_on, is_active)`.
- [ ] Add primary key, foreign key to customers, not-null fields, and a constraint requiring monthly_fee > 0.
- [ ] Enforce uniqueness of `(customer_id, plan_name, started_on)` to prevent the same duplicate subscription; add at least one valid test row.

**Pass checks**

- [ ] A valid subscription can be inserted and selected.
- [ ] Zero or negative monthly_fee is rejected by the database.
- [ ] An unknown customer_id is rejected; a duplicate key combination is rejected.

**Isolation:** This day creates a new table. You may `DROP TABLE subscriptions` afterward; no other day depends on it.

**Interview reflection:** What is the difference between app-level validation and database constraints?

**Save as:** `Week-06/Day-36.sql`  |  **Progress:** ☐ Not started

---

### DAY 37 — Safe Inventory Update in a Transaction

**Level:** Medium  |  **Target:** 35–50 minutes  |  **Concepts:** START TRANSACTION, UPDATE, ROLLBACK

**Challenge:** Simulate reserving two desks while protecting against negative stock.

**Tasks**

- [ ] Start a transaction; update only product 308 if its current stock is at least 2.
- [ ] Inspect the affected row count and the stock before/after.
- [ ] ROLLBACK to preserve the starter dataset.

**Pass checks**

- [ ] Desk stock changes temporarily from 4 to 2.
- [ ] After ROLLBACK it is 4 again.
- [ ] Trying to reserve 10 desks must not make stock negative.

**Interview reflection:** Why should availability be checked as part of UPDATE rather than just a previous SELECT?

**Save as:** `Week-06/Day-37.sql`  |  **Progress:** ☐ Not started

---

### DAY 38 — Atomic Wallet Transfer

**Level:** Medium–Hard  |  **Target:** 50–65 minutes  |  **Concepts:** Transactions, row locks, consistency

**Challenge:** Design and demonstrate an atomic 750-unit transfer between two wallet accounts.

**Tasks**

- [ ] Create a temporary practice table `wallet_accounts(account_id PRIMARY KEY, balance DECIMAL(10,2) NOT NULL)` with a nonnegative balance constraint.
- [ ] Insert account 901 with 5000 and account 902 with 1000.
- [ ] Inside one transaction, lock necessary rows, debit source only if funds are sufficient, and credit destination.
- [ ] Verify results; ROLLBACK and test insufficient funds without losing money.

**Pass checks**

- [ ] After a successful simulated transfer: 901 = 4250 and 902 = 1750.
- [ ] Sum of balances stays 6000.
- [ ] A transfer greater than available balance must not change either balance.

**Safety:** Use only synthetic account data; drop this practice table when done.

**Interview reflection:** What would go wrong if the debit committed but the credit failed?

**Save as:** `Week-06/Day-38.sql`  |  **Progress:** ☐ Not started

---

### DAY 39 — Investigate a Query With EXPLAIN

**Level:** Medium  |  **Target:** 40–55 minutes  |  **Concepts:** EXPLAIN, indexing, query plans

**Challenge:** Investigate performance of a query filtering orders by customer and date.

**Tasks**

- [ ] Write a SELECT for orders from customer 201 since 2026-10-01.
- [ ] Run EXPLAIN and record access type, key choice, and estimated rows.
- [ ] Create a composite index on `(customer_id, order_date)` using a new descriptive index name, then re-run EXPLAIN.
- [ ] Note that this tiny dataset may make the optimizer ignore the index; do not claim a speedup without evidence.

**Pass checks**

- [ ] Resulting order IDs are 401, 403, 412, 415.
- [ ] Your write-up records the actual before/after EXPLAIN output, even if unchanged.

**Cleanup:** Optionally DROP the index after studying; other days do not require it.

**Interview reflection:** Why does index column order matter for composite indexes?

**Save as:** `Week-06/Day-39.sql`  |  **Progress:** ☐ Not started

---

### DAY 40 — Recursive Management Hierarchy

**Level:** Hard  |  **Target:** 50–65 minutes  |  **Concepts:** WITH RECURSIVE, hierarchy traversal

**Challenge:** Find all direct and indirect reports under manager Neha (employee_id 105).

**Tasks**

- [ ] Return `employee_id`, `employee_name`, `depth` where direct reports have depth 1.
- [ ] Use a recursive CTE based on manager_id; do not hardcode employee names.
- [ ] Exclude Neha herself and sort by depth, then employee_id.

**Pass checks**

- [ ] Direct reports include Amol and Priya.
- [ ] Indirect report Rohan appears at depth 2.
- [ ] Total 3 reports are returned.

**Interview reflection:** What protection would you add if hierarchical data contained a cycle?

**Save as:** `Week-06/Day-40.sql`  |  **Progress:** ☐ Not started

---

### DAY 41 — Best Deployed ML Model per Dataset

**Level:** Medium–Hard  |  **Target:** 40–55 minutes  |  **Concepts:** Window ranking, filtering, ML metadata

**Challenge:** Select the highest-accuracy production model for each dataset.

**Tasks**

- [ ] Only include rows with deployment_stage = production.
- [ ] Within each dataset, choose the greatest accuracy; break ties with latest started_at, then highest run_id.
- [ ] Return `dataset_name`, `model_name`, `accuracy`, `started_at`.

**Pass checks**

- [ ] fraud_ds selects fraud_v3 (0.9100), not staging fraud_v2 (0.9200).
- [ ] reviews selects sentiment_v3 (0.9000); credit selects risk_v2 (0.8700).

**Interview reflection:** Why would choosing the globally highest accuracy across different datasets be misleading?

**Save as:** `Week-06/Day-41.sql`  |  **Progress:** ☐ Not started

---

### DAY 42 — Final SQL Analytics Capstone

**Level:** Hard  |  **Target:** 60–80 minutes  |  **Concepts:** Multi-join, CTE, GROUP BY, aggregates, report correctness

**Challenge:** Build a monthly sales dashboard from delivered orders using one final SELECT statement.

**Tasks**

- [ ] Return `year_month`, `delivered_order_count`, `revenue`, `average_order_value`.
- [ ] Include only delivered orders; derive historical totals from quantity × unit_price.
- [ ] Ensure each order is counted once even though it has multiple line items.
- [ ] Order months chronologically; round monetary outputs to two decimals.

**Pass checks**

- [ ] 2026-09: 2 orders, revenue 10500, AOV 5250.00.
- [ ] 2026-10: 9 orders, revenue 217200, AOV 24133.33.
- [ ] 2026-11: 1 order, revenue 4000, AOV 4000.00.

**Interview reflection:** How do you prevent join duplication and verify financial reports?

**Save as:** `Week-06/Day-42.sql`  |  **Progress:** ☐ Not started

---

## Weekly self-review (repeat after every 7 days)

- [ ] Can I explain every query without reading its SQL file?
- [ ] Did I test at least one boundary or NULL case in each applicable challenge?
- [ ] Can I explain why each join or window function is needed?
- [ ] Have I re-solved at least two questions from earlier weeks without help?
- [ ] Did I push clean, readable `.sql` files to GitHub with no credentials?

## Interview readiness: what counts as a completed challenge?

A challenge is done only if **(1)** the query or script executes in MySQL 8, **(2)** it produces the correct records, **(3)** it handles the named edge cases, and **(4)** you can explain it out loud. Passing by copying someone else’s SQL is not completion.

**Bonus practice after the 42 days:** Re-solve 10 random medium problems without seeing earlier solutions; timebox them and review your execution plans and indexing assumptions.

*Prepared as an independent continuation of the 42-Day Python OOP challenge. No complete SQL answers are intentionally provided.*
