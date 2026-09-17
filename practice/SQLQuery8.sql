USE SalesDB;

SELECT *
FROM   sales.Customers;

SELECT *
FROM   sales.Employees;

SELECT firstname,
       lastname
FROM   sales.customers
UNION
SELECT firstname,
       lastname
FROM   sales.employees;

SELECT   firstname,
         lastname
FROM     sales.customers
UNION
SELECT   firstname,
         lastname
FROM     sales.employees
ORDER BY firstname;

SELECT c.CustomerID AS ID,
       c.LastName AS Last_Name
FROM   Sales.Customers AS c
UNION ALL
SELECT e.EmployeeID,
       e.LastName
FROM   Sales.Employees AS e;

SELECT firstname,
       lastname
FROM   sales.Employees
EXCEPT
SELECT firstname,
       lastname
FROM   sales.Customers;

SELECT firstname,
       lastname
FROM   sales.Employees
INTERSECT
SELECT firstname,
       lastname
FROM   sales.Customers;

SELECT *
FROM   sales.Orders;

SELECT *
FROM   sales.OrdersArchive;

SELECT 'Orders' AS SourceTable,
       *
FROM   sales.Orders
UNION
SELECT 'OrdersArchive' AS SourceTable,
       *
FROM   sales.OrdersArchive;

SELECT [OrderID],
       'Orders' AS SourceTable,
       [ProductID],
       [CustomerID],
       [SalesPersonID],
       [OrderDate],
       [ShipDate],
       [OrderStatus],
       [ShipAddress],
       [BillAddress],
       [Quantity],
       [Sales],
       [CreationTime]
FROM   sales.Orders
UNION
SELECT [OrderID],
       'OrdersArchive' AS SourceTable,
       [ProductID],
       [CustomerID],
       [SalesPersonID],
       [OrderDate],
       [ShipDate],
       [OrderStatus],
       [ShipAddress],
       [BillAddress],
       [Quantity],
       [Sales],
       [CreationTime]
FROM   Sales.OrdersArchive
order by shipdate desc;