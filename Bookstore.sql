CREATE DATABASE BOOK_STORE;
USE BOOK_STORE;

CREATE TABLE BOOKS(
	Book_id SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(100),
    Published_Year int,
    Price NUMERIC(10,2),
    Stock int
    );
    
CREATE TABLE CUSTOMERS(
	Customer_id SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Contact_number VARCHAR(15),
    City VARCHAR(20),
    Country VARCHAR(50)
    );
    
CREATE TABLE ORDERS(
	Order_id SERIAL PRIMARY KEY,
    Customer_id INT REFERENCES CUSTOMERS(Customer_id),
    Book_id INT REFERENCES BOOKS(Book_id),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10,2)
    );
    

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Books.csv'
INTO TABLE BOOKS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

ALTER TABLE CUSTOMERS MODIFY City VARCHAR(100);
ALTER TABLE CUSTOMERS MODIFY Country VARCHAR(100);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
INTO TABLE CUSTOMERS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

ALTER TABLE ORDERS MODIFY Order_Date VARCHAR(100);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
INTO TABLE ORDERS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM BOOKS;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;


-- Basic Queries
 
-- 1) Retrieve all books in the "Fiction" genre
SELECT Title 
FROM BOOKS 
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950
SELECT Title 
FROM BOOKS
WHERE Published_year>1950;

--  3) List all customers from the Canada
SELECT Name,customer_id 
FROM CUSTOMERS
WHERE lower(COUNTRY)='canada'
LIMIT 10;


--  4) Show orders placed in November 2023
SELECT ORDER_ID 
FROM ORDERS
WHERE ORDER_DATE  BETWEEN  01-09-2023 and 30-09-2023;

-- 5) Retrieve the total stock of books available
SELECT sum(stock) AS Total_Stock
FROM books;

-- 6) Find the details of the most expensive book
SELECT Title,Author,genre,price 
FROM books
ORDER BY price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT c.customer_id,name,contact_number,city,country,quantity
FROM customers c
INNER JOIN orders o 
ON c.customer_id=o.customer_id
WHERE quantity>1;

 -- 8) Retrieve all orders where the total amount exceeds $20
SELECT b.book_id,Title,Author,Genre,published_year,price,Total_amount
FROM books b
INNER JOIN orders r 
ON b.book_id=r.book_id
WHERE total_amount>20;

-- 9) List all genres available in the Books table
SELECT DISTINCT genre 
FROM books;

-- 10) Find the book with the lowest stock
SELECT BOOK_ID,TITLE, AUTHOR, PRICE, STOCK 
FROM BOOKS
ORDER BY STOCK 
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders
SELECT SUM(TOTAL_AMOUNT) AS Revenue 
FROM ORDERS;



-- ADVANCE QUIERIES 

--  1) Retrieve the total number of books sold for each genre
SELECT genre, sum(quantity) AS Books_sold
FROM books b
JOIN orders o 
ON b.book_id=o.book_id
GROUP BY genre;

--  2) Find the average price of books in the "Fantasy" genre
SELECT genre, AVG(price) 
FROM books
WHERE genre='Fantasy';

--  3) List customers who have placed at least 2 orders
SELECT name,o.customer_id,count(order_id) 
FROM orders o
JOIN customers c 
ON o.customer_id=c.customer_id
GROUP BY customer_id
HAVING COUNT(order_id)>=2;

--  4) Find the most frequently ordered book
SELECT Title,b.book_id,count(order_id) AS order_count 
FROM books b
JOIN orders o 
ON b.book_id=o.book_id
GROUP BY book_id
ORDER BY order_count DESC
LIMIT 1;

--  5) Show the top 3 most expensive books of 'Fantasy' Genre 
SELECT title, genre,price 
FROM books
WHERE genre='Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author
SELECT author, SUM(quantity) AS books_sold 
FROM books b
JOIN orders o 
ON b.book_id=o.book_id
GROUP BY b.book_id;

--  7) List the cities where customers who spent over $30 are located
SELECT city,Total_amount 
FROM orders o
JOIN customers c 
ON o.customer_id=c.customer_id
WHERE total_amount>30;

--  8) Find the customer who spent the most on orders
SELECT name,sum(total_amount) AS total_spent 
FROM customers c
JOIN orders o 
ON c.customer_id=o.customer_id
GROUP BY name
ORDER BY total_spent DESC
LIMIT 1;

--  9) Calulate the stock remaining after fulfilling all orders
SELECT b.book_id,title,stock,quantity,stock-quantity AS remaining_stock 
FROM books b
JOIN orders o 
ON b.book_id=o.book_id
ORDER BY b.book_id;
 





