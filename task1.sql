-- Question 1: Create the TechShop Database
CREATE DATABASE TechShop;
USE TechShop;

-- Question 2: Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Address TEXT NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT UNIQUE,
    QuantityInStock INT NOT NULL,
    LastStockUpdate DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Question 3: Insert Sample Data
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'Saravanan', 'N', 'saravanan@gmail.com', '8248344887', 'Chennai, TN'),
(2, 'Arun', 'Kumar', 'arun.kumar@gmail.com', '9876543210', 'Bangalore, KA'),
(3, 'Priya', 'Sharma', 'ABCD@gmail.com', '9765432109', 'Coimbatore, India'),
(4, 'Venkatesh', 'R', 'venkatesh.r@gmail.com', '9823456781', 'Hyderabad, TS'),
(5, 'Deepika', 'Iyer', 'deepika.iyer@gmail.com', '9988776655', 'Coimbatore, TN'),
(6, 'Rahul', 'Verma', 'rahul.verma@gmail.com', '9123456789', 'Pune, MH'),
(7, 'Anjali', 'G', 'anjali@gmail.com', '9876123450', 'New Delhi, DL'),
(8, 'Suresh', 'P', 'suresh@gmail.com', '8967452310', 'Kochi, KL'),
(9, 'Meera', 'R', 'meera@gmail.com', '9856472314', 'Visakhapatnam, AP'),
(10, 'Karthik', 'S', 'karthik@gmail.com', '8945123789', 'Madurai, TN'),
(11, 'Rajesh', 'Kumar', 'rajesh.kumar@email.com', '9876543210', 'Chennai, India');

INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', 'Dell Inspiron 15', 71500.00),
(2, 'Smartphone', 'Samsung Galaxy S21', 60500.00),
(3, 'Tablet', 'Apple iPad Air', 49500.00),
(4, 'Smartwatch', 'Garmin Fitness Watch', 16500.00),
(5, 'Wireless Earbuds', 'Sony WF-1000XM4', 19800.00),
(6, 'Gaming Console', 'Sony PlayStation 5', 55000.00),
(7, 'Monitor', 'LG 24-inch 4K Monitor', 33000.00),
(8, 'Keyboard', 'Mechanical RGB Keyboard', 5500.00),
(9, 'External Hard Drive', 'Seagate 1TB HDD', 7700.00),
(10, 'Router', 'Netgear WiFi 6 Router', 11000.00),
(11, 'Smart Speaker', 'Voice-controlled AI assistant', 7000.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-03-19', 50),
(2, 2, '2024-03-18', 30),
(3, 3, '2024-03-17', 20),
(4, 4, '2024-03-16', 25),
(5, 5, '2024-03-15', 15),
(6, 6, '2024-03-14', 40),
(7, 7, '2024-03-13', 35),
(8, 8, '2024-03-12', 45),
(9, 9, '2024-03-11', 60),
(10, 10, '2024-03-10', 55);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 65000, '2024-03-01'),
(2, 4, 15000, '2024-03-04'),
(3, 5, 18000, '2024-03-05'),
(4, 6, 50000, '2024-03-06'),
(5, 7, 30000, '2024-03-07'),
(6, 8, 5000, '2024-03-08'),
(7, 9, 7000, '2024-03-09'),
(8, 10, 10000, '2024-03-10'),
(9, 5, 5000, '2024-03-19');
