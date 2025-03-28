--TASK 4
-- q1
select firstname, lastname, email 
from customers 
where customerid not in (select distinct customerid from orders);

-- q2
select count(*) as total_products from products;

--q3
select sum(od.quantity * p.price) as total_revenue 
from orderdetails od 
join products p on od.productid = p.productid;

-- q4
declare @category varchar(255) = 'Electronics';  
select avg(od.quantity) as avg_quantity_ordered 
from orderdetails od 
join products p on od.productid = p.productid 
where p.description like '%' + @category + '%';

-- q5
declare @customer_id int = 1;  
select sum(od.quantity * p.price) as customer_revenue 
from orders o 
join orderdetails od on o.orderid = od.orderid 
join products p on od.productid = p.productid 
where o.customerid = @customer_id;

-- q6
select top 1 c.firstname, c.lastname, count(o.orderid) as order_count 
from customers c 
join orders o on c.customerid = o.customerid 
group by c.customerid, c.firstname, c.lastname
order by order_count desc;

-- q7
select top 1 p.description as category, sum(od.quantity) as total_quantity_ordered 
from orderdetails od 
join products p on od.productid = p.productid 
group by p.description
order by total_quantity_ordered desc;

-- q8
select p.productname 
from products p 
join inventory i on p.productid = i.productid 
where i.quantityinstock = 0;

-- q9
select top 1 * from orders order by orderdate desc;

-- q10
select year(orderdate) as year, month(orderdate) as month, count(*) as total_orders 
from orders 
group by year(orderdate), month(orderdate) 
order by year(orderdate) desc, month(orderdate) desc;
