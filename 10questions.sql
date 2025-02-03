----------------------------------------------------------------------------------
select Orders.OrderID,Products.ProductName,Suppliers.SupplierName 
from Customers 
INNER JOIN orders 
on Customers.customerID = Orders.OrderID  
INNER JOIN OrderDetails
on orders.OrderID = OrderDetails.OrderDetailID
INNER JOIN Products 
on Products.ProductID = OrderDetails.OrderDetailID
INNER JOIN Suppliers
on Products.ProductID = Suppliers.SupplierID
----------------------------------------------------------------------------------
select Products.ProductName,Suppliers.SupplierName 
from Products 
INNER JOIN Suppliers
on Products.ProductID = Suppliers.SupplierID
----------------------------------------------------------------------------------
select Orders.OrderID, Products.ProductName,Suppliers.SupplierName 
from Orders  
INNER JOIN OrderDetails
on orders.OrderID = OrderDetails.OrderID
INNER JOIN Products 
on OrderDetails.ProductID = Products.ProductID
INNER JOIN Suppliers
on Suppliers.SupplierID = Products.SupplierID 
----------------------------------------------------------------------------------
SELECT Employees.FirstName,SUM(OrderDetails.Quantity)
from Employees
INNER JOIN Orders
on Employees.EmployeeID=Orders.EmployeeID
INNER JOIN OrderDetails
on orders.OrderID = OrderDetails.OrderID
INNER JOIN Products 
on OrderDetails.ProductID = Products.ProductID
group by Employees.FirstName
----------------------------------------------------------------------------------
select categories.CategoryName,COUNT(OrderDetails.OrderID) as Number_of_orders
from Categories
INNER JOIN Products
On Categories.CategoryID = Products.CategoryID
INNER JOIN OrderDetails
On Products.ProductID = OrderDetails.ProductID
group by CategoryName
----------------------------------------------------------------------------------
select categories.CategoryName,COUNT(OrderDetails.Quantity),COUNT(OrderDetails.OrderID)as Number_of_orders
from Categories
INNER JOIN Products
On Categories.CategoryID = Products.CategoryID
INNER JOIN OrderDetails
On Products.ProductID = OrderDetails.ProductID
group by CategoryName
----------------------------------------------------------------------------------
SELECT * FROM OrderDetails
select * from Products
select sum(Products.Price*OrderDetails.Quantity) from Products Inner Join OrderDetails 
on Products.ProductID=OrderDetails.ProductID
----------------------------------------------------------------------------------
select Customers.CustomerName,SUM(Products.Price*OrderDetails.Quantity) as total_cost
from Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID 
Inner Join OrderDetails 
on Orders.OrderID=OrderDetails.OrderID 
Inner Join Products
on OrderDetails.ProductID=Products.ProductID
group by CustomerName
----------------------------------------------------------------------------------
select Suppliers.SupplierName,Shippers.ShipperName from Shippers 
INNER JOIN Orders 
ON Shippers.ShipperID = Orders.ShipperID 
INNER JOIN OrderDetails 
on Orders.OrderID=OrderDetails.OrderID 
Inner Join Products
on OrderDetails.ProductID=Products.ProductID
INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
----------------------------------------------------------------------------------
select Customers.CustomerName , Orders.OrderID 
from Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID 
WHERE orders.CustomerID is NULL
----------------------------------------------------------------------------------
SELECT Products.ProductID , Products.ProductName
FROM PRODUCTS 
LEFT JOIN ORDERDETAILS ON Products.ProductID = ORDERDETAILS.PRODUCTID
WHERE ORDERDETAILS.PRODUCTID IS NULL;

----------------------------------------------------------------------------------
select TOP 5 Categories.CategoryName, sum( OrderDetails.Quantity) as sold 
from Categories
INNER JOIN Products
On Categories.CategoryID = Products.CategoryID
INNER JOIN OrderDetails
On Products.ProductID = OrderDetails.ProductID
group by CategoryName
order by sold desc
----------------------------------------------------------------------------------
select top 5 count(Products.ProductID) as sold,Customers.CustomerName,Products.ProductName
from Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID 
Inner Join OrderDetails 
on Orders.OrderID=OrderDetails.OrderID 
Inner Join Products
on OrderDetails.ProductID=Products.ProductID
GROUP BY CustomerName,Products.ProductName
order by sold desc
----------------------------------------------------------------------------------
select OrderID, sum( OrderDetails.Quantity) as sold from OrderDetails group by OrderID
order by sold desc
select * from Products
sum(Products.ProductID)
select sum(Products.ProductID)
 from Products


