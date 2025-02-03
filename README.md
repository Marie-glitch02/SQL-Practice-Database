# SQL Queries 

This repository contains a collection of SQL queries for analyzing an e-commerce database. The database includes tables such as `Customers`, `Orders`, `OrderDetails`, `Products`, `Suppliers`, `Categories`, `Employees`, and `Shippers`.

## Queries

### 1. Order Details with Product and Supplier Information
```sql
SELECT 
    Orders.OrderID,
    Products.ProductName,
    Suppliers.SupplierName 
FROM Customers 
INNER JOIN Orders ON Customers.CustomerID = Orders.OrderID  
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderDetailID
INNER JOIN Products ON Products.ProductID = OrderDetails.OrderDetailID
INNER JOIN Suppliers ON Products.ProductID = Suppliers.SupplierID;
```
### 2. Product-Supplier Relationships
```sql
SELECT 
    Products.ProductName,
    Suppliers.SupplierName 
FROM Products 
INNER JOIN Suppliers ON Products.ProductID = Suppliers.SupplierID;
```
### 3. Order Information with Product Details
```sql
SELECT 
    Orders.OrderID,
    Products.ProductName,
    Suppliers.SupplierName 
FROM Orders  
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID;
```
### 4. Employee Sales Performance
```sql
SELECT 
    Employees.FirstName,
    SUM(OrderDetails.Quantity) AS TotalItemsSold
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Employees.FirstName;
```
### 5. Category Order Counts
```sql
SELECT 
    Categories.CategoryName,
    COUNT(OrderDetails.OrderID) AS Number_of_orders
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY CategoryName;
```
### 6. Detailed Category Sales Analysis
```sql
SELECT 
    Categories.CategoryName,
    COUNT(OrderDetails.Quantity) AS TotalItems,
    COUNT(OrderDetails.OrderID) AS Number_of_orders
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY CategoryName;
```
### 7. Total Sales Calculation
```sql
SELECT SUM(Products.Price * OrderDetails.Quantity) AS TotalRevenue
FROM Products 
INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID;
```
### 8. Customer Spending Analysis
```sql
SELECT 
    Customers.CustomerName,
    SUM(Products.Price * OrderDetails.Quantity) AS total_cost
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID 
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY CustomerName;
```
### 9. Shipping Provider Analysis
```sql
SELECT 
    Suppliers.SupplierName,
    Shippers.ShipperName 
FROM Shippers 
INNER JOIN Orders ON Shippers.ShipperID = Orders.ShipperID 
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID 
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;
```
### 10. Inactive Customers
```sql
SELECT 
    Customers.CustomerName,
    Orders.OrderID 
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
WHERE Orders.CustomerID IS NULL;
```
### 11. Unsold Products
```sql
SELECT 
    Products.ProductID,
    Products.ProductName
FROM PRODUCTS 
LEFT JOIN ORDERDETAILS ON Products.ProductID = ORDERDETAILS.PRODUCTID
WHERE ORDERDETAILS.PRODUCTID IS NULL;
```
### 12. Top Selling Categories
```sql
SELECT TOP 5 
    Categories.CategoryName,
    SUM(OrderDetails.Quantity) AS TotalSold 
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY CategoryName
ORDER BY TotalSold DESC;
```
### 13. Top Customers and Products
```sql
SELECT TOP 5 
    COUNT(Products.ProductID) AS TotalSold,
    Customers.CustomerName,
    Products.ProductName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID 
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY CustomerName, Products.ProductName
ORDER BY TotalSold DESC;
```
### 14. Order Quantity Analysis
```sql
SELECT 
    OrderID,
    SUM(OrderDetails.Quantity) AS TotalItems 
FROM OrderDetails 
GROUP BY OrderID
ORDER BY TotalItems DESC;
```
## Overall Practice Report
This practice involved writing and analyzing a series of SQL queries to explore and extract insights from a relational database. The queries focused on joining multiple tables, such as Customers, Orders, OrderDetails, Products, Suppliers, and Categories, to retrieve meaningful data. Key tasks included calculating total sales, identifying top-selling categories and customers, analyzing employee performance, and detecting inactive customers or unsold products. The practice demonstrated proficiency in SQL operations like JOIN, GROUP BY, SUM, COUNT, and filtering with WHERE and HAVING. Overall, this exercise enhanced skills in database querying, data analysis, and deriving actionable insights from complex datasets.
