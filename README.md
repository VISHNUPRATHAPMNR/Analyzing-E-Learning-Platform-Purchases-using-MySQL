# Analyzing-E-Learning-Platform-Purchases-using-MySQL
This project demonstrates the use of MySQL Workbench for designing and analyzing an e-learning platform database. The project focuses on managing learner, course, and purchase data using relational database concepts and SQL queries.
# Analyzing E-Learning Platform Purchases using MySQL

## Project Overview

This project is a MySQL-based data analysis project that focuses on analyzing purchase data from an online e-learning platform. The project demonstrates database creation, table relationships, SQL joins, aggregations, filtering, and analytical querying techniques.

The system stores information about learners, courses, and purchase transactions to generate meaningful business insights such as learner spending, top-selling courses, and category-wise revenue.

---

# Objectives

- Design a relational database using MySQL
- Create tables with Primary Key and Foreign Key relationships
- Insert and manage sample data
- Perform data exploration using SQL JOINs
- Generate analytical insights using SQL queries
- Practice real-world SQL data analysis concepts

---

# Technologies Used

- SQL
- MySQL
- MySQL Workbench

---

# Database Schema

## 1. learners

Stores learner information.

| Column Name | Data Type |
|---|---|
| learner_id | INT |
| full_name | VARCHAR |
| country | VARCHAR |

---

## 2. courses

Stores course details.

| Column Name | Data Type |
|---|---|
| course_id | INT |
| course_name | VARCHAR |
| category | VARCHAR |
| unit_price | DECIMAL |

---

## 3. purchases

Stores learner purchase records.

| Column Name | Data Type |
|---|---|
| purchase_id | INT |
| learner_id | INT |
| course_id | INT |
| quantity | INT |
| purchase_date | DATE |

---

# Relationships

- `learner_id` in purchases references learners table
- `course_id` in purchases references courses table

---

# SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- INSERT INTO
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions
- Revenue Calculations

---

# Analytical Queries

The project includes the following analytical queries:

1. Total spending by each learner
2. Top 3 most purchased courses
3. Category-wise revenue analysis
4. Learners purchasing from multiple categories
5. Courses with no purchases

---

# Key Insights

- SQL, Python, and Power BI courses showed high demand.
- Programming and Visualization categories generated strong revenue.
- Some learners purchased courses across multiple categories.
- Revenue analysis helps identify profitable course segments.

---

# Recommendations

- Focus marketing on high-performing course categories
- Promote underperforming courses
- Create bundled learning packages
- Use learner purchase history for personalized recommendations

---

# Project Files

| File Name | Description |
|---|---|
| elearning_project.sql | Complete MySQL script |
| summary_report.docx | Project summary report |
| README.md | Project documentation |

---

# How to Run the Project

## Step 1: Open MySQL Workbench

Connect to your MySQL local server.

---

## Step 2: Create Database

Run the SQL script provided in:

```sql
elearning_project.sql
```

---

## Step 3: Execute Queries

Run all queries sequentially to:

- Create tables
- Insert sample data
- Perform joins
- Generate analytical reports

---

# Learning Outcomes

This project improved practical knowledge in:

- Relational Database Design
- SQL Querying
- Data Analysis
- Business Insight Generation
- Database Relationships

---

# Author

## Vishnu Prathap

Aspiring Data Analyst with skills in:

- SQL
- Python
- Excel
- Power BI
- Data Visualization

---

# License

This project is created for educational and portfolio purposes.
