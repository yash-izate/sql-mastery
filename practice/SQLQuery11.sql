USE SalesDB;

SELECT *
FROM   sales.Customers;

UPDATE sales.Customers
SET    score = NULL
WHERE  score = 0;

SELECT customerid,
       score,
       COALESCE (score, 0) AS score2,
       avg(score) OVER () AS before_avg,
       avg(COALESCE (score, 0)) OVER () AS after_avg
FROM   sales.Customers;

SELECT customerid,
       concat(firstname, ' ', lastname) AS full_name,
       COALESCE (score, 0) + 10 AS new_score
FROM   sales.Customers;

SELECT o.CustomerID,
       count(*) AS total_customers,
       sum(Sales) AS total_sales,
       avg(sales) AS avg_sales,
       min(sales) AS min_sales,
       max(sales) AS max_sales
FROM   sales.Customers AS c, sales.Orders AS o
group by o.CustomerID;