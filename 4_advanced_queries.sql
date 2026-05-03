-- Advance queries:

-- 1) Retrieve the total number of books sold for each genre:

SELECT b.genre, SUM(o.quantity) AS Total_Book_Sold 
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.genre
ORDER BY Total_Book_Sold DESC;

-- 2) Find the average price of books in the "Fantasy" genre:

SELECT ROUND(AVG(Price), 2) AS Avg_Price
FROM Books
WHERE genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders:

SELECT c.customer_id, c.name, COUNT(o.order_id) AS Total_Orders
FROM Customers c
JOIN Orders o ON c.customer_Id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2
ORDER BY Total_Orders DESC;

-- 4) Find the most frequently ordered book:

WITH book_counts AS (
    SELECT b.book_id, b.title, COUNT(*) AS order_count
    FROM Books b
    JOIN Orders o ON b.book_id = o.book_id
    GROUP BY b.book_id, b.title
)
SELECT *
FROM book_counts
WHERE order_count = (SELECT MAX(order_count) FROM book_counts);

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.author, SUM(o.quantity) AS Total_book_sold
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.author
ORDER BY Total_book_sold DESC;

-- 7) List the cities where customers who spent over $30 are located:

SELECT c.city, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount) > 30;

-- 8) Find the customer who spent the most on orders:

SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent 
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_Spent DESC
LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id, b.title, b.stock
ORDER BY b.book_id;

--10) Find the total number of orders and total revenue for each month:

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 11) List the top 5 customers who generated the highest total revenue:

SELECT c.name, SUM(o.total_amount) AS revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 5;

-- 12) Identify customers who have never placed any order:

SELECT c.customer_id, c.name FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL
ORDER BY c.customer_id;

-- 13) Find the top 3 genres by total revenue:

SELECT b.genre, SUM(o.total_amount) AS total_revenue
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.genre
ORDER BY total_revenue DESC
LIMIT 3;

-- 14) List books where remaining stock is less than 5:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id, b.title, b.stock
HAVING b.stock- COALESCE(SUM(o.quantity),0) < 5
ORDER BY b.book_id;

-- 15) Find the Second highest selling book

SELECT *
FROM (
	SELECT b.book_id, b.title, SUM(o.quantity) AS total_sold,
	DENSE_RANK() OVER (ORDER BY SUM(o.quantity) DESC) AS rnk
	FROM Books b
	JOIN Orders o ON b.book_id = o.book_id
	GROUP BY b.book_id, b.title
) t
WHERE rnk = 2;