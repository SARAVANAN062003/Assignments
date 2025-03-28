-- Question 1
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Question 2
SELECT OrderDetails.OrderID, Products.ProductName, OrderDetails.Quantity, Products.Price
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID;

-- Question 3
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

-- Question 4
SELECT Products.ProductID, Products.ProductName, Inventory.QuantityInStock
FROM Products
JOIN Inventory ON Products.ProductID = Inventory.ProductID;

-- Question 5
SELECT Orders.OrderID, Orders.OrderDate, COUNT(OrderDetails.ProductID) AS TotalProducts
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID, Orders.OrderDate;

-- Question 6
SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalSold
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalSold DESC;

-- Question 7
SELECT DISTINCT Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Question 8
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

-- Question 9
SELECT Products.ProductID, Products.ProductName
FROM Products
LEFT JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE OrderDetails.ProductID IS NULL;

-- Question 10
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
