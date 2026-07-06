# # Bank Customer Churn Analysis (SQL Data Project)

## 📌 Project Overview
Customer retention is one of the primary drivers of long-term profitability in retail banking. This project focuses on analyzing an industry-standard **Customer Churn Dataset** containing 10,000 records. Using **PostgreSQL / MySQL**, I designed a structured relational database schema and executed descriptive analytics queries to isolate exactly why, when, and which demographics of customers are leaving the bank.

---

## 📊 Key Analytical Objectives & Discoveries
Through complex SQL aggregations, window operations, and conditional logic, this project investigates the following drivers of churn:

* **Overall Baseline:** Calculating the total churn percentage across the entire customer base.
* **Geographic Trends:** Grouping metrics by `Geography` to see if service location impacts customer satisfaction.
* **Age-Demographic Segmentation:** Bucketing customer ages into custom ranges (`18-25`, `26-31`, etc.) to find the most volatile life stages.
* **Financial Risk Factor:** Checking if a customer's `CreditScore` correlates heavily with account cancellations.
* **Gender Behavioral Variance:** Isolating churn rates specifically between Male and Female segments.
* **Customer Lifetime Loyalty:** Segmenting customers into loyalty lifecycles (`newMembers`, `EstablishMembers`, `loyal`) based on their `Tenure`.
* **Product Optimization:** Evaluating how multi-product ownership (`NumOfProducts`) affects the customer's likelihood to leave.

---

## 🛠️ Tech Stack & Skills Highlighted
* **Database Management Engine:** PostgreSQL / MySQL 
* **SQL Techniques Implemented:** * Relational Schema Creation (`CREATE TABLE`, `PRIMARY KEY`, data constraints)
  * Data Categorization (`CASE WHEN` logic strings)
  * Aggregations & Math Functions (`SUM`, `COUNT`, `AVG`, `ROUND`)
  * Data Segregation and Ordering (`GROUP BY`, `ORDER BY`)

---

## 🗂️ Database Schema Definition
```sql
CREATE DATABASE bank_customer;

CREATE TABLE churn_modelling (
    RowNumber INT PRIMARY KEY,
    CustomerId BIGINT UNIQUE NOT NULL,
    Surname VARCHAR(50),
    CreditScore INT,
    Geography VARCHAR(30),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance DECIMAL(12,2),
    NumOfProducts INT,
    HasCrCard BOOLEAN,
    IsActiveMember BOOLEAN,
    EstimatedSalary DECIMAL(12,2),
    Exited BOOLEAN
);
