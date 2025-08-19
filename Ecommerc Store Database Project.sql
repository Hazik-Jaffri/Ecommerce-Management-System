CREATE DATABASE Ecommerce_Store;
USE Ecommerce_Store;

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    DateRegistered TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Address
CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    HouseNo INT NOT NULL,
    Street_Block VARCHAR(50) NOT NULL,
    Area VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Category Table
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);

-- Product table
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10, 2) NOT NULL,
    Brand VARCHAR(100),
    Quantity INT DEFAULT 0,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Cart
CREATE TABLE Cart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Cart Items
CREATE TABLE CartItem (
    CartItemID INT AUTO_INCREMENT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Order
CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Order Item
CREATE TABLE OrderItem (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PriceAtPurchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Payment 
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT UNIQUE,
    CustomerID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod VARCHAR(30),
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Shipping
CREATE TABLE Shipping (
    ShippingID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT UNIQUE,
    AddressID INT,
    ShippingDate DATE,
    DeliveryDate DATE,
    ShippingStatus VARCHAR(20),
    ShippingMethod VARCHAR(30),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

-- Dummy Data
INSERT INTO Customer (Name, Email, Password, PhoneNumber)
VALUES
('Ali Raza', 'ali@example.com', 'pass123', '03001234567'),
('Sara Khan', 'sara@example.com', 'pass456', '03111234567'),
('Ahmed Malik', 'ahmed@example.com', 'pass789', '03221234567'),
('Ayesha Noor', 'ayesha@example.com', 'pass321', '03331234567'),
('Bilal Iqbal', 'bilal@example.com', 'pass654', '03441234567'),
('Hira Zahid', 'hira@example.com', 'pass987', '03551234567'),
('Usman Tariq', 'usman@example.com', 'pass147', '03661234567'),
('Maria Shakeel', 'maria@example.com', 'pass258', '03771234567'),
('Zain Haider', 'zain@example.com', 'pass369', '03881234567'),
('Noor Fatima', 'noor@example.com', 'pass111', '03991234567');

INSERT INTO Address (CustomerID, HouseNo, Street_Block, Area, City, Province, PostalCode, Country)
VALUES
(1, 12, 'Block A', 'Gulberg', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(2, 45, 'Block B', 'DHA', 'Karachi', 'Sindh', '75500', 'Pakistan'),
(3, 67, 'Block C', 'Model Town', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(4, 78, 'Block D', 'Satellite Town', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
(5, 23, 'Block E', 'University Road', 'Peshawar', 'KPK', '25000', 'Pakistan'),
(6, 89, 'Block F', 'F-10', 'Islamabad', 'ICT', '44000', 'Pakistan'),
(7, 34, 'Block G', 'Shah Faisal', 'Karachi', 'Sindh', '75100', 'Pakistan'),
(8, 90, 'Block H', 'Iqbal Town', 'Lahore', 'Punjab', '54000', 'Pakistan'),
(9, 11, 'Block I', 'Cantt', 'Multan', 'Punjab', '60000', 'Pakistan'),
(10, 56, 'Block J', 'G-8', 'Islamabad', 'ICT', '44000', 'Pakistan');

INSERT INTO Category (CategoryName, Description)
VALUES
('Electronics', 'Devices and gadgets'),
('Fashion', 'Clothing and accessories'),
('Books', 'Books and magazines'),
('Home & Kitchen', 'Home appliances and kitchenware'),
('Sports', 'Sports and fitness equipment'),
('Beauty', 'Beauty and personal care products'),
('Toys', 'Toys and games'),
('Groceries', 'Food and beverages'),
('Automotive', 'Vehicle-related items'),
('Health', 'Health care products');

INSERT INTO Product (Name, Description, Price, Brand, Quantity, CategoryID)
VALUES
('Smartphone X', 'Latest model with 128GB', 85000, 'TechnoMob', 100, 1),
('Jeans Men Slim Fit', 'Blue denim slim fit jeans', 2500, 'FashionWear', 150, 2),
('Cooking Pan Set', 'Non-stick 3-piece set', 3200, 'HomeChef', 200, 4),
('Football', 'Standard size football', 1200, 'SportStar', 80, 5),
('Shampoo 500ml', 'Anti-dandruff formula', 750, 'GlowPlus', 300, 6),
('Toy Car', 'Remote control toy car', 1800, 'FunToys', 60, 7),
('Whey Protein', 'Chocolate flavor 2lb', 4500, 'HealthGain', 50, 10),
('Laptop Bag', 'Waterproof laptop backpack', 2100, 'PackIt', 90, 1),
('T-shirt', 'Cotton T-shirt for women', 1200, 'StyleZone', 120, 2),
('Olive Oil 1L', 'Extra virgin olive oil', 1500, 'NatureFresh', 70, 8);

INSERT INTO Cart (CustomerID)
VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO CartItem (CartID, ProductID, Quantity)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 2),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 2),
(9, 10, 1);

INSERT INTO `Order` (CustomerID, TotalAmount, OrderStatus)
VALUES
(1, 112500, 'Pending'),
(2, 3200, 'Shipped'),
(3, 2400, 'Delivered'),
(4, 1200, 'Cancelled'),
(5, 750, 'Pending'),
(6, 1800, 'Pending'),
(7, 4500, 'Delivered'),
(8, 2100, 'Pending'),
(9, 2400, 'Shipped'),
(10, 1500, 'Delivered');

INSERT INTO OrderItem (OrderID, ProductID, Quantity, PriceAtPurchase)
VALUES
(1, 1, 1, 85000),
(1, 2, 1, 27500),
(2, 3, 1, 3200),
(3, 4, 2, 1200),
(4, 4, 1, 1200),
(5, 5, 1, 750),
(6, 6, 1, 1800),
(7, 7, 1, 4500),
(8, 8, 1, 2100),
(9, 9, 2, 1200);

INSERT INTO Payment (OrderID, CustomerID, PaymentMethod, Amount, PaymentStatus)
VALUES
(1, 1, 'Credit Card', 112500, 'Paid'),
(2, 2, 'PayPal', 3200, 'Paid'),
(3, 3, 'COD', 2400, 'Paid'),
(4, 4, 'Credit Card', 1200, 'Refunded'),
(5, 5, 'COD', 750, 'Paid'),
(6, 6, 'Debit Card', 1800, 'Failed'),
(7, 7, 'PayPal', 4500, 'Paid'),
(8, 8, 'COD', 2100, 'Paid'),
(9, 9, 'Credit Card', 2400, 'Paid'),
(10, 10, 'Debit Card', 1500, 'Paid');

INSERT INTO Shipping (OrderID, AddressID, ShippingDate, DeliveryDate, ShippingStatus, ShippingMethod)
VALUES
(1, 1, '2024-06-10', '2024-06-15', 'Pending', 'Express'),
(2, 2, '2024-06-01', '2024-06-03', 'Delivered', 'Standard'),
(3, 3, '2024-06-05', '2024-06-08', 'Delivered', 'Express'),
(4, 4, NULL, NULL, 'Cancelled', 'None'),
(5, 5, '2024-06-11', NULL, 'In Transit', 'Standard'),
(6, 6, NULL, NULL, 'Pending', 'Standard'),
(7, 7, '2024-06-06', '2024-06-10', 'Delivered', 'Express'),
(8, 8, '2024-06-12', NULL, 'Pending', 'Standard'),
(9, 9, '2024-06-09', '2024-06-11', 'Delivered', 'Express'),
(10, 10, '2024-06-04', '2024-06-06', 'Delivered', 'Standard');

-- Get all orders with customer name and order total
SELECT o.OrderID, c.Name AS CustomerName, o.TotalAmount, o.OrderDate
FROM `Order` o
JOIN Customer c ON o.CustomerID = c.CustomerID;

-- Get shipping info with address and customer details
SELECT s.ShippingID, c.Name AS CustomerName, a.City, a.Street_Block, s.ShippingStatus, s.ShippingMethod
FROM Shipping s
JOIN `Order` o ON s.OrderID = o.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Address a ON s.AddressID = a.AddressID;

-- Aggregate Data Using GROUP BY
-- Number of orders placed by each customer:
SELECT c.CustomerID, c.Name, COUNT(o.OrderID) AS TotalOrders
FROM Customer c
JOIN `Order` o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

-- Update Order Status
UPDATE `Order`
SET OrderStatus = 'Delivered'
WHERE OrderID = 3;