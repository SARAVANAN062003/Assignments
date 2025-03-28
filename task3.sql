Task 3
--1.  
select * from Customers as c
join
Orders o
on  c.CustomerID=o.CustomerID;


--2. 
select p.ProductName, SUM(p.Price * o.Quantity) as Total_Revenue from Products as p
join
OrderDetails o
on  p.ProductID=o.ProductID  
  group by p.ProductID, p.ProductName;


--3. 
 SELECT c.FirstName, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.Phone
HAVING COUNT(o.CustomerID) >= 1;


--4.
 SELECT Top 1 p.ProductName, SUM(o.Quantity) AS Total_Quantity
FROM Products p
JOIN OrderDetails o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Quantity desc;


--5. 
SELECT p.ProductName,p.Description
FROM Products p;


--6. 
 SELECT c.FirstName,c.LastName, AVG(o.TotalAmount) Average_Order_Value
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName, c.LastName;


--7. 
select TOP 1  c.CustomerID, c.FirstName, c.LastName, c.Email, SUM(p.Price * o.Quantity) as Total_Revenue from Products as p
join
OrderDetails o
on  p.ProductID=o.ProductID  
join Orders od on od.OrderID=o.OrderID
join Customers c on od.CustomerID = c.CustomerID
group by p.ProductID, p.ProductName, c.CustomerID, c.FirstName, c.LastName, c.Email
order by Total_Revenue desc;


--8.
  select p.ProductID,p.ProductName, Count(o.OrderID) as No_of_Times_Ordered from Products as p
join
OrderDetails o
on  p.ProductID=o.ProductID  
group by p.ProductID, p.ProductName;


--9.
 SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName, c.Email  
FROM Customers c  
JOIN Orders o ON c.CustomerID = o.CustomerID  
JOIN OrderDetails od ON o.OrderID = od.OrderID  
JOIN Products p ON od.ProductID = p.ProductID  
WHERE p.ProductName = 'Laptop';  

--10.
 SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2012-01-23' AND '2018-12-12';
