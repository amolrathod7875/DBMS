# Phase 3: SQL — Topic 36: Database Fundamentals 🗄️

## 1. What is a Database?

A database is an organized collection of data that allows us to store, manage, retrieve, and update information efficiently.

For example, an e-commerce application may store:
- Customer information
- Product details
- Orders
- Payments
- Delivery information

Instead of maintaining everything in separate files, databases help organize and manage this information.

## 2. What is a DBMS?

DBMS stands for **Database Management System**. It is software that allows users and applications to create, store, retrieve, update, and manage data in databases.

Popular DBMS examples:
- MySQL
- PostgreSQL
- Oracle Database
- Microsoft SQL Server
- SQLite
- MongoDB

## 3. What is an RDBMS?

RDBMS stands for **Relational Database Management System**. It stores data in tables consisting of rows and columns.

**Example:** A Customers table.

| Customer_ID | Name  | City   |
| ----------- | ----- | ------ |
| 101         | Rahul | Mumbai |
| 102         | Priya | Delhi  |
| 103         | Amit  | Pune   |

Here:
- **Table:** Customers
- **Row:** One customer's complete record
- **Column:** A specific attribute
- **Cell:** A single value

RDBMS allows us to establish relationships between different tables.

## 4. What is SQL?

SQL stands for **Structured Query Language**. It is used to communicate with relational databases.

Using SQL, you can:
- Retrieve data
- Insert new records
- Update existing records
- Delete records
- Create tables
- Modify database structures
- Manage permissions

**Example:**

```sql
SELECT *
FROM Customers;
```

This query retrieves all records from the Customers table.

## 5. Understanding Database Relationships

Relational databases connect multiple tables using keys.

Consider two tables:

**Customers:**

| Customer_ID | Name  |
| ----------- | ----- |
| 101         | Rahul |
| 102         | Priya |

**Orders:**

| Order_ID | Customer_ID | Amount |
| -------- | ----------- | ------ |
| 501      | 101         | 2500   |
| 502      | 102         | 1800   |
| 503      | 101         | 3200   |

The `Customer_ID` column connects the two tables. This helps us identify which customer placed each order.

## 6. What are Primary Keys?

A **Primary Key** uniquely identifies every record in a table.

**Example:**

```sql
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);
```

**Important points:**
- Must contain unique values.
- Cannot contain NULL values.
- Each table can have only one primary key constraint, which may contain multiple columns.

## 7. What are Foreign Keys?

A **Foreign Key** connects one table to another by referencing a candidate key, commonly the primary key, in another table.

**Example:**

```sql
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Amount DECIMAL(10,2),

    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID)
);
```

This relationship helps maintain referential integrity.

## 8. Types of SQL Data Types

Data types define what kind of values a column can store.

### Numeric:
- `INT`
- `BIGINT`
- `FLOAT`
- `DECIMAL`

### Text:
- `CHAR`
- `VARCHAR`
- `TEXT`

### Date and Time:
- `DATE`
- `TIME`
- `DATETIME`
- `TIMESTAMP`

### Boolean

**Example:**

```sql
CREATE TABLE Employees (
    Employee_ID INT,
    Employee_Name VARCHAR(100),
    Salary DECIMAL(10,2),
    Joining_Date DATE,
    Is_Active BOOLEAN
);
```

## 9. What are SQL Constraints?

Constraints are rules applied to columns to maintain data accuracy and integrity.

**Important constraints:**
- `PRIMARY KEY` — Uniquely identifies records.
- `FOREIGN KEY` — Maintains relationships between tables.
- `NOT NULL` — Prevents NULL values.
- `UNIQUE` — Prevents duplicate values.
- `CHECK` — Enforces a condition.
- `DEFAULT` — Provides a default value.

**Example:**

```sql
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    City VARCHAR(50) DEFAULT 'Unknown'
);
```

## 10. Types of SQL Commands

SQL commands are commonly divided into five categories.

### 1. DDL — Data Definition Language
Used to define database structures.
- `CREATE`
- `ALTER`
- `DROP`
- `TRUNCATE`

### 2. DML — Data Manipulation Language
Used to modify data.
- `INSERT`
- `UPDATE`
- `DELETE`

### 3. DQL — Data Query Language
Used to retrieve data.
- `SELECT`

### 4. DCL — Data Control Language
Used to manage database permissions.
- `GRANT`
- `REVOKE`

### 5. TCL — Transaction Control Language
Used to manage transactions.
- `COMMIT`
- `ROLLBACK`
- `SAVEPOINT`

## 11. OLTP vs OLAP

These are two important database processing concepts.

### OLTP (Online Transaction Processing)
Used for day-to-day transactions.
- Banking transactions
- Online shopping
- Money transfers
- Ticket bookings

### OLAP (Online Analytical Processing)
Used for analyzing large amounts of historical data.
- Sales analysis
- Business intelligence dashboards
- Revenue reporting
- Customer behavior analysis

## 12. Where Are Databases Used in AI?

Databases play an important role in AI applications.

Examples:
- Storing training datasets
- Managing customer information
- Retrieving historical data
- Storing model predictions
- Supporting recommendation systems
- Providing data to AI-powered applications
- Managing information used in RAG systems

A typical AI application workflow:

```
User
  ↓
AI Application
  ↓
Backend API
  ↓
Database
  ↓
Retrieve Relevant Data
  ↓
AI Model
  ↓
Generate Response
```

## 🔑 Key Takeaways

- A database stores and organizes information.
- DBMS helps manage databases.
- RDBMS stores data in related tables.
- SQL is used to communicate with relational databases.
- Primary Keys uniquely identify records.
- Foreign Keys establish relationships between tables.
- Constraints maintain data integrity.
- OLTP handles transactions, while OLAP supports analytics.

---

📌 *Double Tap ❤️ For More*