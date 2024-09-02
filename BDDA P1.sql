create database shopper_stop;

use shopper_stop;

CREATE TABLE Customers (
	CustomerID INT Primary Key,
	FirstName VARCHAR (50) NOT NULL,
	LastName VARCHAR (50),
	Email VARCHAR (50),
	Phone CHAR (11),
	Address VARCHAR (100),
	City VARCHAR (20),
	State VARCHAR (60),
	PostalCode CHAR (6),
	Country VARCHAR (20)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description TEXT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(50),
    Phone CHAR(11),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(255),
    ManagerName VARCHAR(50),
    ContactNumber CHAR(11)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    StoreID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    StoreID INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Brand VARCHAR(50),
    Price DECIMAL(10, 2),
    SupplierID INT,
    Description TEXT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    StoreID INT,
    Quantity INT,
    ReorderLevel INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customers VALUES
(1, 'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
(2, 'Sneha', 'Patel', 'sneha.patel@example.com', '9876543211', '456 FC Road', 'Pune', 'Maharashtra', '411004', 'India'),
(3, 'Rahul', 'Verma', 'rahul.verma@example.com', '9876543212', '789 Nehru Nagar', 'Delhi', 'Delhi', '110006', 'India'),
(4, 'Pooja', 'Reddy', 'pooja.reddy@example.com', '9876543213', '321 Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'India'),
(5, 'Vikram', 'Singh', 'vikram.singh@example.com', '9876543214', '654 Rajaji Nagar', 'Bengaluru', 'Karnataka', '560010', 'India'),
(6, 'Anjali', 'Desai', 'anjali.desai@example.com', '9876543215', '987 Sarojini Nagar', 'Chennai', 'Tamil Nadu', '600017', 'India'),
(7, 'Karan', 'Gupta', 'karan.gupta@example.com', '9876543216', '147 Gandhi Market', 'Ahmedabad', 'Gujarat', '380009', 'India'),
(8, 'Priya', 'Kumar', 'priya.kumar@example.com', '9876543217', '258 Gariahat', 'Kolkata', 'West Bengal', '700019', 'India'),
(9, 'Rohit', 'Mehta', 'rohit.mehta@example.com', '9876543218', '369 Sector 17', 'Chandigarh', 'Chandigarh', '160017', 'India'),
(10, 'Sonal', 'Joshi', 'sonal.joshi@example.com', '9876543219', '741 Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'India');

INSERT INTO Categories VALUES
(1, 'Apparel', 'Clothing items for men, women, and children'),
(2, 'Formal Wear', 'Clothing items for formal occasions'),
(3, 'Ethnic Wear', 'Traditional Indian clothing items'),
(4, 'Footwear', 'Shoes, sandals, and other footwear'),
(5, 'Accessories', 'Watches, jewelry, and other accessories'),
(6, 'Bags', 'Handbags, backpacks, and other types of bags'),
(7, 'Electronics', 'Electronic devices and gadgets'),
(8, 'Computers', 'Laptops, desktops, and related accessories'),
(9, 'Home Appliances', 'Home and kitchen appliances'),
(10, 'Sportswear', 'Clothing and accessories for sports and fitness');

INSERT INTO Suppliers VALUES
(1, 'Nike India Pvt. Ltd.', 'Rahul Menon', '022-45678901', 'rahul.menon@nike.com', 'Mumbai, Maharashtra'),
(2, 'Levi''s India Pvt. Ltd.', 'Kiran Rao', '020-56789012', 'kiran.rao@levis.com', 'Pune, Maharashtra'),
(3, 'Raymond Ltd.', 'Sanjay Joshi', '011-67890123', 'sanjay.joshi@raymond.com', 'Delhi, Delhi'),
(4, 'Nalli Silks', 'Priya Reddy', '040-78901234', 'priya.reddy@nalli.com', 'Hyderabad, Telangana'),
(5, 'Adidas India', 'Vikram Desai', '080-89012345', 'vikram.desai@adidas.com', 'Bengaluru, Karnataka'),
(6, 'Titan Company Ltd.', 'Meena Sharma', '044-90123456', 'meena.sharma@titan.com', 'Chennai, Tamil Nadu'),
(7, 'Caprese India', 'Amit Patel', '079-12345678', 'amit.patel@caprese.com', 'Ahmedabad, Gujarat'),
(8, 'Samsung India', 'Ravi Kumar', '033-23456789', 'ravi.kumar@samsung.com', 'Kolkata, West Bengal'),
(9, 'Dell India Pvt. Ltd.', 'Suresh Verma', '0172-34567890', 'suresh.verma@dell.com', 'Chandigarh, Chandigarh'),
(10, 'LG Electronics India', 'Nidhi Agarwal', '0522-45678901', 'nidhi.agarwal@lg.com', 'Lucknow, Uttar Pradesh');

INSERT INTO Stores VALUES
(1, 'Shopper''s Stop - Mumbai', 'Mumbai', 'Rajesh Patel', '022-23456789'),
(2, 'Shopper''s Stop - Pune', 'Pune', 'Neha Desai', '020-12345678'),
(3, 'Shopper''s Stop - Delhi', 'Delhi', 'Suresh Singh', '011-98765432'),
(4, 'Shopper''s Stop - Hyderabad', 'Hyderabad', 'Lakshmi Reddy', '040-87654321'),
(5, 'Shopper''s Stop - Bengaluru', 'Bengaluru', 'Ravi Kumar', '080-56789012'),
(6, 'Shopper''s Stop - Chennai', 'Chennai', 'Mohan Iyer', '044-34567890'),
(7, 'Shopper''s Stop - Ahmedabad', 'Ahmedabad', 'Anita Shah', '079-23456789'),
(8, 'Shopper''s Stop - Kolkata', 'Kolkata', 'Arun Bose', '033-45678901'),
(9, 'Shopper''s Stop - Chandigarh', 'Chandigarh', 'Amanpreet Kaur', '0172-12345678'),
(10, 'Shopper''s Stop - Lucknow', 'Lucknow', 'Vivek Agarwal', '0522-56789012');

INSERT INTO Employees VALUES
(1, 'Rakesh', 'Shah', 'Store Manager', 1, '2020-01-15', 60000),
(2, 'Neha', 'Kapoor', 'Sales Associate', 2, '2019-06-25', 30000),
(3, 'Anil', 'Kumar', 'Cashier', 3, '2018-11-05', 25000),
(4, 'Lakshmi', 'Rao', 'Customer Service', 4, '2020-03-10', 28000),
(5, 'Vijay', 'Deshmukh', 'Security Officer', 5, '2017-07-15', 22000),
(6, 'Meena', 'Iyer', 'Sales Associate', 6, '2021-02-20', 30000),
(7, 'Pooja', 'Gupta', 'Inventory Manager', 7, '2016-09-30', 40000),
(8, 'Arun', 'Bose', 'Store Manager', 8, '2020-12-01', 60000),
(9, 'Suman', 'Patel', 'Customer Service', 9, '2019-04-18', 28000),
(10, 'Vivek', 'Singh', 'Cashier', 10, '2020-07-22', 25000);

INSERT INTO Orders VALUES
(1, 1, '2024-08-01', 1, 8799.98),
(2, 2, '2024-08-02', 2, 3999.99),
(3, 3, '2024-08-03', 3, 2299.99),
(4, 4, '2024-08-04', 4, 2999.99),
(5, 5, '2024-08-05', 5, 12999.99),
(6, 6, '2024-08-06', 6, 4999.99),
(7, 7, '2024-08-07', 7, 2499.99),
(8, 8, '2024-08-08', 8, 14999.99),
(9, 9, '2024-08-09', 9, 49999.99),
(10, 10, '2024-08-10', 10, 35999.99);

INSERT INTO Products VALUES
(1, 'T-Shirt', 1, 'Nike', 799.99, 1, 'Men''s Cotton T-Shirt'),
(2, 'Jeans', 1, 'Levi''s', 1499.99, 2, 'Blue Denim Jeans'),
(3, 'Formal Shirt', 2, 'Raymond', 1299.99, 3, 'Men''s Formal Cotton Shirt'),
(4, 'Saree', 3, 'Nalli', 1999.99, 4, 'Silk Saree with Embroidery'),
(5, 'Sports Shoes', 4, 'Adidas', 2999.99, 5, 'Running Shoes with Mesh Upper'),
(6, 'Wrist Watch', 5, 'Titan', 3999.99, 6, 'Analog Watch with Leather Strap'),
(7, 'Handbag', 6, 'Caprese', 2499.99, 7, 'Women''s Leather Handbag'),
(8, 'Mobile Phone', 7, 'Samsung', 14999.99, 8, 'Android Smartphone with 64GB Storage'),
(9, 'Laptop', 8, 'Dell', 49999.99, 9, '15.6" Laptop with Intel Core i5'),
(10, 'Air Conditioner', 9, 'LG', 35999.99, 10, '1.5 Ton Split AC with Inverter Technology');

INSERT INTO OrderDetails VALUES
(1, 1, 1, 2, 799.99),
(2, 1, 2, 1, 1499.99),
(3, 2, 3, 1, 1299.99),
(4, 3, 4, 1, 1999.99),
(5, 4, 5, 1, 2999.99),
(6, 5, 6, 1, 3999.99),
(7, 6, 7, 1, 2499.99),
(8, 7, 8, 1, 14999.99),
(9, 8, 9, 1, 49999.99),
(10, 9, 10, 1, 35999.99);

INSERT INTO Inventory VALUES
(1, 1, 1, 100, 20),
(2, 2, 2, 150, 30),
(3, 3, 3, 200, 40),
(4, 4, 4, 80, 15),
(5, 5, 5, 60, 10),
(6, 6, 6, 50, 10),
(7, 7, 7, 70, 20),
(8, 8, 8, 40, 10),
(9, 9, 9, 30, 5),
(10, 10, 10, 25, 5);

INSERT INTO Transactions VALUES
(1, 1, 'Credit Card', '2024-08-01', 8799.98),
(2, 2, 'Debit Card', '2024-08-02', 3999.99),
(3, 3, 'Cash', '2024-08-03', 2299.99),
(4, 4, 'Net Banking', '2024-08-04', 2999.99),
(5, 5, 'UPI', '2024-08-05', 12999.99),
(6, 6, 'Credit Card', '2024-08-06', 4999.99),
(7, 7, 'Debit Card', '2024-08-07', 2499.99),
(8, 8, 'Cash', '2024-08-08', 14999.99),
(9, 9, 'Net Banking', '2024-08-09', 49999.99),
(10, 10, 'UPI', '2024-08-10', 35999.99);

SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM ORDERDETAILS;
SELECT * FROM STORES;
SELECT * FROM INVENTORY;
SELECT * FROM SUPPLIERS;
SELECT * FROM CATEGORIES;
SELECT * FROM EMPLOYEES;
SELECT * FROM TRANSACTIONS;

-- Creating roles
CREATE ROLE StoreManager;
CREATE ROLE InventoryManager;
CREATE ROLE SalesAssociate;
CREATE ROLE CustomerService;
CREATE ROLE Admin;

GRANT SELECT, INSERT, UPDATE ON Orders TO StoreManager;
GRANT SELECT, INSERT, UPDATE ON Inventory TO StoreManager;
GRANT SELECT, INSERT, UPDATE ON Employees TO StoreManager;

GRANT SELECT, INSERT, UPDATE ON Inventory TO InventoryManager;
GRANT SELECT, INSERT, UPDATE ON Suppliers TO InventoryManager;

GRANT SELECT ON Orders TO SalesAssociate;
GRANT SELECT ON Products TO SalesAssociate;

CREATE USER 'rajesh'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'neha'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'anil'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'pooja'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';

-- Granting privileges to rajesh (StoreManager equivalent)
GRANT SELECT, INSERT, UPDATE ON shopper_stop.Orders TO 'rajesh'@'localhost';
GRANT SELECT, INSERT, UPDATE ON shopper_stop.Inventory TO 'rajesh'@'localhost';
GRANT SELECT, INSERT, UPDATE ON shopper_stop.Employees TO 'rajesh'@'localhost';

-- Granting privileges to neha (InventoryManager equivalent)
GRANT SELECT, INSERT, UPDATE ON shopper_stop.Inventory TO 'neha'@'localhost';
GRANT SELECT, INSERT, UPDATE ON shopper_stop.Suppliers TO 'neha'@'localhost';

-- Granting privileges to anil (SalesAssociate equivalent)
GRANT SELECT ON shopper_stop.Orders TO 'anil'@'localhost';
GRANT SELECT ON shopper_stop.Products TO 'anil'@'localhost';

-- Granting privileges to pooja (CustomerService equivalent)
GRANT SELECT, INSERT, UPDATE ON shopper_stop.Customers TO 'pooja'@'localhost';
GRANT SELECT ON shopper_stop.Orders TO 'pooja'@'localhost';

-- Granting all privileges to admin
GRANT ALL PRIVILEGES ON shopper_stop.* TO 'admin'@'localhost';

FLUSH PRIVILEGES;
