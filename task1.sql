use techshop;
-- Question 1: Create the TechShop Database
CREATE DATABASE TechShop;
USE TechShop;

-- Question 2: Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Address TEXT NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT UNIQUE,
    QuantityInStock INT NOT NULL,
    LastStockUpdate DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Question 3: Insert Sample Data
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Saravanan', 'N', 'saravanan@gmail.com', '8248344887', 'Chennai, TN'),
('Arun', 'Kumar', 'arun.kumar@gmail.com', '9876543210', 'Bangalore, KA'),
('Priya', 'Sharma', 'ABCD@gmail.com', '9765432109', 'Coimbatore, India'),
('Venkatesh', 'R', 'venkatesh.r@gmail.com', '9823456781', 'Hyderabad, TS'),
('Deepika', 'Iyer', 'deepika.iyer@gmail.com', '9988776655', 'Coimbatore, TN'),
('Rahul', 'Verma', 'rahul.verma@gmail.com', '9123456789', 'Pune, MH'),
('Anjali', 'G', 'anjali@gmail.com', '9876123450', 'New Delhi, DL'),
('Suresh', 'P', 'suresh@gmail.com', '8967452310', 'Kochi, KL'),
('Meera', 'R', 'meera@gmail.com', '9856472314', 'Visakhapatnam, AP'),
('Karthik', 'S', 'karthik@gmail.com', '8945123789', 'Madurai, TN'),
('Rajesh', 'Kumar', 'rajesh.kumar@email.com', '9876543210', 'Chennai, India');

INSERT INTO Products (ProductName, Description, Price) VALUES
('Laptop', 'Dell Inspiron 15', 71500.00),
('Smartphone', 'Samsung Galaxy S21', 60500.00),
('Tablet', 'Apple iPad Air', 49500.00),
('Smartwatch', 'Garmin Fitness Watch', 16500.00),
('Wireless Earbuds', 'Sony WF-1000XM4', 19800.00),
('Gaming Console', 'Sony PlayStation 5', 55000.00),
('Monitor', 'LG 24-inch 4K Monitor', 33000.00),
('Keyboard', 'Mechanical RGB Keyboard', 5500.00),
('External Hard Drive', 'Seagate 1TB HDD', 7700.00),
('Router', 'Netgear WiFi 6 Router', 11000.00),
('Smart Speaker', 'Voice-controlled AI assistant', 7000.00);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-03-19', 50),
(2, '2024-03-18', 30),
(3, '2024-03-17', 20),
(4, '2024-03-16', 25),
(5, '2024-03-15', 15),
(6, '2024-03-14', 40),
(7, '2024-03-13', 35),
(8, '2024-03-12', 45),
(9, '2024-03-11', 60),
(10, '2024-03-10', 55);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 65000, '2024-03-01'),
(4, 15000, '2024-03-04'),
(5, 18000, '2024-03-05'),
(6, 50000, '2024-03-06'),
(7, 30000, '2024-03-07'),
(8, 5000, '2024-03-08'),
(9, 7000, '2024-03-09'),
(10, 10000, '2024-03-10'),
(5, 5000, '2024-03-19');

