-- Import Data

Copy Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\Online_Bookstore\Books.csv'
CSV HEADER;

Copy Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:\Online_Bookstore\Customers.csv'
CSV HEADER;

Copy Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'D:\Online_Bookstore\Orders.csv'
CSV Header;
