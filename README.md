# 📚 Online Bookstore SQL Analysis

## 📌 Project Overview

This project analyzes an online bookstore dataset using SQL to extract meaningful insights related to sales performance, customer behavior, and inventory management. The goal is to support data-driven decision-making using structured query techniques.

---

## 🎯 Objectives

* Analyze sales and revenue trends
* Identify high-value customers and purchasing patterns
* Evaluate product performance and demand
* Monitor inventory and stock availability
* Perform data validation and consistency checks

---

## 🛠️ Tools & Technologies

* SQL (PostgreSQL)
* CSV datasets

---

## 🗂️ Database Schema

### 📘 Books

* Book_ID (Primary Key)
* Title, Author, Genre
* Published Year
* Price, Stock

### 👤 Customers

* Customer_ID (Primary Key)
* Name, Email, Phone
* City, Country

### 🧾 Orders

* Order_ID (Primary Key)
* Customer_ID, Book_ID (Foreign Keys)
* Order Date
* Quantity, Total Amount

---

## 🔍 Key Analysis Performed

### 📊 Sales & Revenue Analysis

* Total revenue generated from all orders
* Monthly order count and revenue trends
* Top 5 customers by total spending
* Top 3 genres by revenue

---

### 👥 Customer Insights

* Customers who placed multiple orders
* Customers who never placed any order
* Highest spending customer

---

### 📚 Product & Performance Analysis

* Most frequently ordered book (handling tie cases using CTE)
* Top 3 most expensive books in Fantasy genre
* Best-selling authors based on quantity sold
* Second highest selling book using window functions

---

### 📦 Inventory Analysis

* Remaining stock after fulfilling all orders
* Identification of low-stock books (stock < 5)
* Detection of unsold books

---

### 🔎 Data Validation

* Verified inconsistencies between order total amount and calculated price × quantity

---

## 🚀 Advanced SQL Concepts Used

* INNER JOIN, LEFT JOIN
* GROUP BY & HAVING
* Aggregate Functions (SUM, COUNT, AVG)
* Window Functions (DENSE_RANK)
* CTE (Common Table Expressions)
* COALESCE for NULL handling
* Subqueries

---

## 📁 Project Structure

```id="dksl20"
📁 online-bookstore-sql-analysis
 ├── 1_schema.sql
 ├── 2_data_import.sql
 ├── 3_basic_queries.sql
 ├── 4_advanced_queries.sql
 ├── dataset/
 │     ├── Books.csv
 │     ├── Customers.csv
 │     ├── Orders.csv
 └── README.md
```

---

## 📊 Sample Business Questions Solved

* What is the total revenue generated?
* Who are the top customers by spending?
* Which genres generate the most revenue?
* Which books are low in stock or unsold?
* Who are repeat customers?
* What are the monthly sales trends?

---

## 💡 Key Insights

* Identified high-value customers contributing significantly to total revenue
* Detected unsold books affecting inventory efficiency
* Highlighted top-performing genres and authors
* Identified low-stock products requiring restocking
* Ensured data accuracy through validation checks

---

## 🔮 Future Enhancements

* Build Power BI dashboard for visualization
* Implement sales forecasting
* Add customer recommendation system

---

## 📢 Conclusion

This project demonstrates strong SQL fundamentals along with practical business analysis skills. It showcases the ability to transform raw data into actionable insights using efficient querying techniques.
