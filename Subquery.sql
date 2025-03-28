-- Q1
select *from Products;
SELECT firstname, lastname, email 
FROM customers 
WHERE customerid NOT IN (SELECT DISTINCT customerid FROM orders);

-- Q2
SELECT (SELECT COUNT(*) FROM products) AS total_products;

-- Q3
SELECT (SELECT SUM(totalamount) FROM orders) AS total_revenue;

-- Q4
SELECT (SELECT AVG(od.quantity) 
        FROM orderdetails od
        WHERE od.productid IN 
              (SELECT productid FROM products WHERE description = 'Dell Inspiron 15')
       ) AS avg_quantity_ordered;

-- Q5
SELECT (SELECT SUM(totalamount) 
        FROM orders 
        WHERE customerid = '1'
       ) AS total_revenue;

-- Q6
SELECT TOP 1 c.firstname, c.lastname, COUNT(o.orderid) AS total_orders 
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
ORDER BY total_orders DESC;

-- Q7
SELECT TOP 1 p.description AS category, SUM(od.quantity) AS total_quantity 
FROM orderdetails od
JOIN products p ON od.productid = p.productid
GROUP BY p.description
ORDER BY total_quantity DESC;

-- Q8
SELECT TOP 1 c.firstname, c.lastname, SUM(o.totalamount) AS total_spent 
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
ORDER BY total_spent DESC;

-- Q9
SELECT (SELECT SUM(totalamount) 
        FROM orders 
        WHERE customerid = 123  
       ) AS total_revenue;



-- Q10
SELECT c.firstname, c.lastname, COUNT(o.orderid) AS order_count 
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname;
