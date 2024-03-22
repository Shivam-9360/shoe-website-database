CREATE TABLE Cart (
    Cart_ID INT PRIMARY KEY,
    GrandTotal DECIMAL NOT NULL,
    ItemTotal DECIMAL NOT NULL
);
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Cart_ID INT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNo VARCHAR(15) NOT NULL,
    DOB DATE,
    Email VARCHAR(100) NOT NULL,
    Age INT,
    FOREIGN KEY (Cart_ID) REFERENCES Cart(Cart_ID)
);
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    CategoryName VARCHAR(15) NOT NULL
);
CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY,
    PhoneNo VARCHAR(15) NOT NULL,
    TotalSales DECIMAL,
  	CompanyName VARCHAR(100) NOT NULL
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Category_ID INT,
    ProductName VARCHAR(100) NOT NULL,
    Stock INT,
    Seller_ID INT,
    Brand VARCHAR(50) NOT NULL,
    MRP DECIMAL NOT NULL,
    Description VARCHAR(255) NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
);
CREATE TABLE Contains (
    Product_ID INT,
    Cart_ID INT,
    PRIMARY KEY (Product_ID, Cart_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Cart_ID) REFERENCES Cart(Cart_ID)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    OrderStatus VARCHAR(50) NOT NULL,
    OrderAmount DECIMAL NOT NULL,
    OrderDate DATE NOT NULL,
    ShippingDate DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE OrderItem (
    OrderItem_ID INT,
    Order_ID INT,
    Quantity INT NOT NULL,
	PRIMARY KEY (OrderItem_ID, Order_ID),
    FOREIGN KEY (OrderItem_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);
CREATE TABLE Payment (
    Order_ID INT,
    Customer_ID INT,
    PaymentMode VARCHAR(50) NOT NULL,
    PRIMARY KEY (Order_ID, Customer_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Review (
    Product_ID INT,
    Customer_ID INT,
    Rating INT NOT NULL,
    Description VARCHAR(255),
    PRIMARY KEY (Product_ID, Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Address (
    Address_ID INT PRIMARY KEY,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    ApartmentNumber VARCHAR(100) NOT NULL,
    DoorNo VARCHAR(100),
    Pincode VARCHAR(20) NOT NULL,
    StreetName VARCHAR(255),
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
