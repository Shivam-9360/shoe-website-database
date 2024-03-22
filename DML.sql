-- 01 => Retrieve all customers
SELECT * 
FROM Customer;

-- 02 => Retrieve all products ids which have some rating more than 3 stars
SELECT DISTINCT Product_ID
FROM Review
WHERE Rating > 3;

-- 03 => Retrieve all products id which have all reviews ratings more than 3
SELECT Product_ID 
FROM Review
EXCEPT
SELECT Product_ID 
FROM Review
WHERE Rating <= 3;

-- 04 => Retrieve product with highest MRP
SELECT * 
FROM Product
WHERE MRP IN (SELECT MAX(MRP)
              FROM PRODUCT);

-- 05 => Retrieve stock of each product category
SELECT CategoryName, Sum(Stock)
FROM Category, Product
WHERE Category.Category_ID = Product.Category_ID
GROUP BY Category.Category_ID;

-- 06 => Retrieve number of products in each cart
SELECT Cart_ID, COUNT(Product_ID) AS "Count"
FROM Contains
GROUP BY Cart_ID;

-- 07 => Retrieve states where customers are located
SELECT DISTINCT State
FROM Address;

-- 08 => Retrieve customers whose name starts with A
SELECT DISTINCT *
FROM Customer
WHERE FirstName LIKE 'A%';

-- 09 => Retrieve products which have been ordered
SELECT DISTINCT OrderItem_ID
FROM OrderItem ;

-- 10 => Retrieve all products sold by ShoeHaven
SELECT Product.ProductName
FROM Product, Seller
WHERE Product.Seller_ID = Seller.Seller_ID AND
	  Seller.CompanyName = 'ShoeHaven';

-- 11 => Retrieve all products in Shivam's carts
SELECT Product.ProductName
FROM Customer, Contains, Product
WHERE Customer.Cart_ID = Contains.Cart_ID AND
	  Contains.Product_ID = Product.Product_ID AND
	  Customer.FirstName = 'Shivam';

-- 12 => Retrieve second oldest customer
SELECT FirstName
FROM Customer
WHERE Age =	(SELECT MAX(Age)
			 FROM Customer
			 WHERE age < (SELECT MAX(Age)
						  FROM Customer));

-- 13 => Retrieve total amount for each order
SELECT Order_ID, OrderAmount
FROM Orders;

-- 14 => Retrieve the number of orders processed in each payment mode
SELECT PaymentMode, COUNT(*) AS NumOrders
FROM Payment
GROUP BY PaymentMode;

-- 15 => Retrieve customers along with their addresses
SELECT c.*, a.*
FROM Customer c
JOIN Address a ON c.Customer_ID = a.Customer_ID;

-- 16 => Retrieve products which have been ordered exactly twice
SELECT p.*
FROM Product p
JOIN OrderItem oi ON p.Product_ID = oi.OrderItem_ID
GROUP BY p.Product_ID
HAVING COUNT(*) = 2;
-- No product is ordered twice

-- 17 => Retrieve products which are in every cart
SELECT p.*
FROM Product p
WHERE NOT EXISTS (
    SELECT DISTINCT Cart_ID
    FROM Cart
    WHERE NOT EXISTS (
        SELECT *
        FROM Contains
        WHERE Contains.Product_ID = p.Product_ID
        AND Contains.Cart_ID = Cart.Cart_ID
    )
);
-- This will give no output as we have 20 different carts and 20 different products so every cart has 1 distinct product

-- 18 => Retrieve customers who have placed an order
SELECT DISTINCT c.*
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID;

-- 19 => Retrieve avg rating of each customer
SELECT Customer_ID, AVG(Rating) AS AvgRating
FROM Review
GROUP BY Customer_ID;

-- 20 => Retrieve customers who have ordered from Sandals category
SELECT DISTINCT c.*
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN OrderItem oi ON o.Order_ID = oi.Order_ID
JOIN Product p ON oi.OrderItem_ID = p.Product_ID
JOIN Category cat ON p.Category_ID = cat.Category_ID
WHERE cat.CategoryName = 'Sandals';


-- 13 => Retrieve total amount for each order
SELECT Order_ID, SUM(OrderAmount) AS TotalAmount
FROM Orders
GROUP BY Order_ID;

-- 14 => Retrieve the number of orders processed in each payment mode
SELECT PaymentMode, COUNT(*) AS NumOrders
FROM Payment
GROUP BY PaymentMode;

-- 15 => Retrieve customers along with their addresses
SELECT c.*, a.*
FROM Customer c
JOIN Address a ON c.Customer_ID = a.Customer_ID;

-- 16 => Retrieve products which have been ordered exactly twice
SELECT p.*
FROM Product p
JOIN OrderItem oi ON p.Product_ID = oi.OrderItem_ID
GROUP BY p.Product_ID
HAVING COUNT(*) = 2;
-- No product is ordered twice

-- 17 => Retrieve products which are in every cart
SELECT p.*
FROM Product p
WHERE NOT EXISTS (
    SELECT DISTINCT Cart_ID
    FROM Cart
    WHERE NOT EXISTS (
        SELECT *
        FROM Contains
        WHERE Contains.Product_ID = p.Product_ID
        AND Contains.Cart_ID = Cart.Cart_ID
    )
);
-- This will give no output as we have 20 different carts and 20 different products so every cart has 1 distinct product

-- 18 => Retrieve customers who have placed an order
SELECT DISTINCT c.*
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID;

-- 19 => Retrieve avg rating of each customer
SELECT Customer_ID, AVG(Rating) AS AvgRating
FROM Review
GROUP BY Customer_ID;

-- 20 => Retrieve customers who have ordered from Sandals category
SELECT DISTINCT c.*
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN OrderItem oi ON o.Order_ID = oi.Order_ID
JOIN Product p ON oi.OrderItem_ID = p.Product_ID
JOIN Category cat ON p.Category_ID = cat.Category_ID
WHERE cat.CategoryName = 'Sandals';
