-- Question 1  
SELECT FirstName, LastName, Email FROM Customers;  

-- Question 2  
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName  
FROM Orders  
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;  

-- Question 3  
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)  
VALUES ('Vikram', 'Singh', 'vikram.singh@gmail.com', '8123456789', '900 Oak St');  

-- Question 4  
UPDATE Products  
SET Price = Price * 1.10;  

-- Question 5  
DELETE FROM OrderDetails WHERE OrderID = 2;  
DELETE FROM Orders WHERE OrderID = 2;  

-- Question 6  
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)  
VALUES (3, '2024-03-20', 25000.00);  

-- Question 7  
UPDATE Customers  
SET Email = 'saravanan@gmail.com', Address = '500 Maple St'  
WHERE CustomerID = 3;  

-- Question 8  
UPDATE Orders  
SET TotalAmount = (  
    SELECT SUM(Products.Price * OrderDetails.Quantity)  
    FROM OrderDetails  
    JOIN Products ON OrderDetails.ProductID = Products.ProductID  
    WHERE OrderDetails.OrderID = Orders.OrderID  
);  

-- Question 9  
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 4);  
DELETE FROM Orders WHERE CustomerID = 4;  

-- Question 10  
INSERT INTO Products (ProductName, Description, Price)  
VALUES ('Smartwatch', 'Advanced fitness tracking smartwatch', 22000.00);  

-- Question 11  
ALTER TABLE Orders ADD Status VARCHAR(20) DEFAULT 'Pending';  

UPDATE Orders  
SET Status = 'Shipped'  
WHERE OrderID = 5;  

-- Question 12  
ALTER TABLE Customers ADD OrderCount INT DEFAULT 0;  

UPDATE Customers  
SET OrderCount = (  
    SELECT COUNT(*)  
    FROM Orders  
    WHERE Orders.CustomerID = Customers.CustomerID  
);    
