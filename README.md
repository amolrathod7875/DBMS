# DBMS — SQL Interview Preparation & Practice

A comprehensive SQL practice repository covering 42-day hands-on SQL challenges, topic reference notes, and exercise solutions. Built for Python / AI-ML / GenAI / backend and software engineering interviews.

## Repository Structure

```
DBMS/
├── README.md                          # This file
├── Exercise.md                        # 42-day SQL challenge roadmap
├── Starter.sql                        # Database setup (MySQL 8.0+)
├── setup/
│   └── 00_create_database.sql         # Database creation script
├── Exercise/                          # Completed exercise solutions
│   ├── AI_Department_Salary_Filter/
│   │   ├── code.sql
│   │   └── README.md
│   └── Unique_Customer_Cities/
│       ├── code.sql
│       └── README.md
├── Notes/                             # SQL topic reference notes
│   ├── Database_Fundamentals/
│   ├── SELECT_Statement/
│   ├── WHERE_Clause/
│   ├── ORDER_BY/
│   ├── LIMIT/
│   ├── DISTINCT/
│   ├── GROUP_BY/
│   ├── HAVING/
│   ├── SQL_JOINS/
│   ├── UNION/
│   ├── Views/
│   ├── Subqueries/
│   └── CTEs/
└── .kilo/                             # Kilo configuration
```

## Overview

This repository is an independent continuation of the 42-Day Python OOP challenge, focusing on making SQL a practical skill alongside DSA and aptitude preparation.

### What's Included

- **42-Day SQL Challenge Roadmap** (`Exercise.md`) — One SQL challenge every day, from basic SELECT to advanced analytics
- **Synthetic Starter Database** (`Starter.sql`) — MySQL 8.0+ database with employees, departments, customers, products, orders, payments, support tickets, and ML runs
- **Exercise Solutions** (`Exercise/`) — Completed SQL solutions with README documentation
- **Topic Reference Notes** (`Notes/`) — Comprehensive SQL topic notes with examples, interview questions, and practice problems

## SQL Topics Covered

### Phase 3: SQL Fundamentals
| Topic | Folder | Description |
|---|---|---|
| Database Fundamentals | `Notes/Database_Fundamentals/` | DBMS, RDBMS, SQL, keys, constraints, OLTP vs OLAP |
| SELECT Statement | `Notes/SELECT_Statement/` | Retrieving data, DISTINCT, aliases, calculations, aggregates, LIMIT |
| WHERE Clause | `Notes/WHERE_Clause/` | Filtering rows, comparison operators, AND/OR/NOT, BETWEEN, IN, LIKE, IS NULL |
| ORDER BY | `Notes/ORDER_BY/` | Sorting rows, ASC/DESC, multi-column sorting, NULL handling |
| LIMIT | `Notes/LIMIT/` | Controlling row count, Top-N analysis, OFFSET, pagination |
| DISTINCT | `Notes/DISTINCT/` | Removing duplicates, multi-column DISTINCT, DISTINCT vs GROUP BY |

### Phase 3: SQL Aggregation
| Topic | Folder | Description |
|---|---|---|
| GROUP BY | `Notes/GROUP_BY/` | Grouping rows, aggregate functions, multiple columns, WHERE + GROUP BY |
| HAVING | `Notes/HAVING/` | Filtering groups, HAVING with COUNT/SUM/AVG/MAX, WHERE vs HAVING |

### Phase 3: SQL Joins & Set Operations
| Topic | Folder | Description |
|---|---|---|
| SQL JOINS | `Notes/SQL_JOINS/` | INNER, LEFT, RIGHT, FULL OUTER, CROSS, SELF joins |
| UNION | `Notes/UNION/` | UNION vs UNION ALL, rules, vertical combination |

### Phase 3: SQL Advanced
| Topic | Folder | Description |
|---|---|---|
| Views | `Notes/Views/` | Virtual tables, CREATE/UPDATE/DROP, updatable views, materialized views |
| Subqueries | `Notes/Subqueries/` | Nested queries, IN/EXISTS/NOT EXISTS, correlated subqueries, derived tables |
| CTEs | `Notes/CTEs/` | Common Table Expressions, WITH keyword, multiple CTEs, CTE vs View |

## Exercises Completed

### Week 1 — Basic Retrieval and Filtering
| Day | Challenge | Level | Status |
|---|---|---|---|
| 01 | AI Department Salary Filter | Easy | ✅ |
| 02 | Unique Customer Cities | Easy | ✅ |

## Getting Started

### Prerequisites
- MySQL Server 8.0+
- SQLTools + SQLTools MySQL/MariaDB driver (VS Code) or MySQL CLI

### Setup
1. Install and start MySQL Server 8.0+
2. Run `Starter.sql` (or `setup/00_create_database.sql`) on your local MySQL server
3. Verify: 12 employees, 8 customers, 11 products, 15 orders, 26 order_items, 14 payments, 9 tickets, 9 ML runs
4. Create a GitHub repository and push your solutions

### Database Schema
The starter database includes these tables:
- `departments` — department_id, department_name
- `employees` — employee_id, employee_name, department_id, salary, hire_date, manager_id, employment_status
- `customers` — customer_id, customer_name, city, signup_date
- `products` — product_id, product_name, category, price, stock
- `orders` — order_id, customer_id, order_date, order_status
- `order_items` — order_item_id, order_id, product_id, quantity, unit_price
- `payments` — payment_id, order_id, amount, paid_at, payment_method, payment_status
- `support_tickets` — ticket_id, customer_id, assigned_employee_id, priority, ticket_status, created_at, resolved_at
- `model_runs` — run_id, model_name, dataset_name, accuracy, started_at, deployment_stage

### Business Rule
Sales revenue is calculated from **delivered orders** using `order_items.quantity * order_items.unit_price`. Pending and cancelled orders are excluded from recognized revenue.

## Key SQL Concepts Covered

- **SELECT** — Retrieve data, DISTINCT, aliases, calculations, aggregate functions
- **WHERE** — Filter rows, comparison operators, AND/OR/NOT, BETWEEN, IN, LIKE, IS NULL
- **ORDER BY** — Sort results, ASC/DESC, multi-column, NULL handling
- **LIMIT** — Restrict rows, Top-N, OFFSET, pagination
- **GROUP BY** — Group rows, aggregate functions, multiple columns
- **HAVING** — Filter groups, aggregate conditions
- **JOINS** — INNER, LEFT, RIGHT, FULL OUTER, CROSS, SELF
- **UNION** — Combine results, UNION vs UNION ALL
- **Views** — Virtual tables, materialized views
- **Subqueries** — Nested queries, correlated subqueries, derived tables
- **CTEs** — Common Table Expressions, WITH keyword

## Practice Rules

- Spend 2–5 minutes sketching tables and required output columns
- Solve independently before reading docs
- Run the query and match every pass check
- Explain join types, aggregation, and index implications
- Add a short comment with your thinking to each `.sql` file
- Commit to GitHub and mark the day complete only after verifying output

## Interview Readiness

A challenge is done only if:
1. The query executes in MySQL 8
2. It produces the correct records
3. It handles named edge cases
4. You can explain it out loud

## License

This repository is for educational purposes. No complete SQL answers are intentionally provided in the challenge roadmap — solutions are in the `Exercise/` folder.

---

*Prepared as an independent continuation of the 42-Day Python OOP challenge.*