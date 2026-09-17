USE MyDatabase;

SELECT *
FROM   customers;

SELECT *
FROM   orders;

SELECT *
FROM   customers AS c
       INNER JOIN
       orders AS o
       ON c.id = o.customer_id;

SELECT customers.id,
       customers.first_name,
       orders.order_id,
       orders.sales
FROM   customers
       INNER JOIN
       orders
       ON id = customer_id;

SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       INNER JOIN
       orders AS o
       ON c.id = o.customer_id;

SELECT customers.id,
       customers.first_name,
       orders.order_id,
       orders.sales
FROM   customers
       LEFT OUTER JOIN
       orders
       ON id = customer_id;

SELECT customers.id,
       customers.first_name,
       orders.order_id,
       orders.sales
FROM   customers
       RIGHT OUTER JOIN
       orders
       ON id = customer_id;

SELECT customers.id,
       customers.first_name,
       orders.order_id,
       orders.sales
FROM   customers
       FULL OUTER JOIN
       orders
       ON id = customer_id;

SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       LEFT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  o.customer_id IS NULL;

SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       RIGHT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  c.id IS NULL;

SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       FULL OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  c.id IS NULL
       OR o.customer_id IS NULL;

SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       FULL OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  c.id IS NOT NULL
       AND o.customer_id IS NOT NULL;

SELECT *
FROM   customers CROSS JOIN orders;

USE SalesDB;

SELECT *
FROM   sales.orders;

SELECT *
FROM   sales.Customers;

SELECT *
FROM   sales.Employees;

SELECT *
FROM   sales.OrdersArchive;

SELECT *
FROM   sales.Products;

SELECT o.OrderID,
       c.FirstName AS Customer_Firstname,
       c.LastName AS Customer_Lastname,
       p.Product AS Product_Name,
       o.Sales,
       p.Price,
       e.FirstName AS Emp_Firstname,
       e.LastName AS Emp_Lastname
FROM   sales.Orders AS o
       LEFT OUTER JOIN sales.Customers AS c
       ON o.CustomerID = c.CustomerID
       LEFT OUTER JOIN sales.Products AS p
       ON o.ProductID = p.ProductID
       LEFT OUTER JOIN sales.Employees AS e
       ON o.SalesPersonID = e.EmployeeID;
