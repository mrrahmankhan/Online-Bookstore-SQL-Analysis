-- Create Database
CREATE DATABASE Bookstores;

-- Create Tables
CREATE TABLE Books(
	Book_ID INT PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(100),
	Published_Year INT,
	Price NUMERIC(10, 2),
	Stock INT
);

CREATE TABLE Customers(
	Customer_ID INT PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(100),
	City VARCHAR(100),
	Country VARCHAR(100)
);

CREATE TABLE Orders(
	Order_ID INT PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;