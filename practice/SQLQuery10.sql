USE SalesDB;

SELECT orderid,
       orderdate,
       shipdate,
       creationtime
FROM   sales.Orders;

SELECT orderid,
       orderdate,
       shipdate,
       creationtime,
       '2026-06-14' AS HardCoded,
       getdate() AS today
FROM   sales.Orders;

SELECT orderid,
       orderdate,
       day(orderdate) AS day_of_order,
       month(orderdate) AS month_of_order,
       year(orderdate) AS year_of_order
FROM   sales.Orders;

SELECT orderid,
       creationtime,
       datepart(year, CreationTime) AS year,
       datepart(QUARTER, CreationTime) AS quarter,
       datepart(month, CreationTime) AS month,
       datepart(day, CreationTime) AS day,
       datepart(WEEK, CreationTime) AS week,
       datepart(WEEKDAY, CreationTime) AS weekday,
       datepart(HOUR, CreationTime) AS hour,
       datepart(MINUTE, CreationTime) AS minute,
       datepart(SECOND, CreationTime) AS second,
       datepart(MILLISECOND, CreationTime) AS millisecond,
       datepart(MICROSECOND, CreationTime) AS microsecond,
       datepart(NANOSECOND, CreationTime) AS nanosecond
FROM   sales.Orders;

SELECT orderid,
       creationtime,
       datepart(year, CreationTime) AS year,
       datepart(QUARTER, CreationTime) AS quarter,
       datename(month, CreationTime) AS month,
       datename(day, CreationTime) AS day,
       datename(WEEK, CreationTime) AS week,
       datename(WEEKDAY, CreationTime) AS weekday
FROM   sales.Orders;

SELECT creationtime,
       DATETRUNC(hour, creationtime) AS hour_level,
       DATETRUNC(day, creationtime) AS day_level,
       DATETRUNC(MONTH, creationtime) AS month_level
FROM   sales.Orders;

SELECT   DATETRUNC(month, creationtime) AS monthly_sales,
         count(*)
FROM     sales.Orders
GROUP BY DATETRUNC(month, creationtime);

SELECT creationtime,
       CAST (DATETRUNC(month, creationtime) AS DATE) AS 'start of month',
       EOMONTH(CREATIONTIME) AS 'end of month'
FROM   sales.Orders;

SELECT creationtime,
       CAST (DATETRUNC(month, creationtime) AS DATE) AS 'start of month',
       EOMONTH(creationtime) AS 'end of month',
       DATEDIFF(DAY, CAST (DATETRUNC(month, creationtime) AS DATE), EOMONTH(creationtime)) AS 'Diff Of Date'
FROM   sales.Orders;

SELECT   datename(month, OrderDate) AS month,
         count(*) AS no_of_order
FROM     sales.Orders
GROUP BY datename(month, OrderDate);

SELECT   datename(WEEKDAY, OrderDate) AS weekday,
         count(*) AS no_of_order
FROM     sales.Orders
GROUP BY datename(weekday, OrderDate);

SELECT   datename(month, OrderDate) AS month,
         count(*) AS orders
FROM     sales.Orders
GROUP BY datename(month, OrderDate)
HAVING   datename(month, OrderDate) = 'February';

SELECT *
FROM   sales.Orders
WHERE  datename(month, OrderDate) = 'February';

SELECT *
FROM   sales.Orders
WHERE  month(OrderDate) IN (2, 3);

SELECT orderid,
       creationtime,
       format(creationtime, 'd') AS Day,
       format(creationtime, 'dd') AS Day,
       format(creationtime, 'ddd') AS Short_Weekday,
       format(creationtime, 'dddd') AS Full_Weekday
FROM   sales.Orders;

SELECT orderid,
       creationtime,
       format(creationtime, 'M') AS MONTH,
       format(creationtime, 'MM') AS MONTH,
       format(creationtime, 'MMM') AS Short_MONTH,
       format(creationtime, 'MMMM') AS Full_MONTH
FROM   sales.Orders;

SELECT orderid,
       creationtime,
       format(creationtime, 'y') AS MONTH_YEAR,
       format(creationtime, 'yy') AS year,
       format(creationtime, 'yyyy') AS Full_year
FROM   sales.Orders;

SELECT orderid,
       creationtime,
       format(creationtime, 'yyyy-MM-dd') AS ISO_Format,
       format(creationtime, 'dd-MM-yyyy') AS Europe_Format,
       format(creationtime, 'MM-dd-yyyy') AS US_Format
FROM   sales.Orders;

SELECT orderid,
       creationtime,
       format(creationtime, 'dd') AS day,
       format(creationtime, 'ddd') AS weekday,
       format(creationtime, 'MMM') AS month,
       format(creationtime, 'yyyy') AS year,
       format(creationtime, 'HH:mm:ss tt') AS time
FROM   Sales.Orders;

SELECT orderid,
       creationtime,
       FORMAT(creationtime, 'dd ddd MMM ') + 'Q' + DATENAME(QUARTER, creationtime) + ' ' + FORMAT(creationtime, 'yyyy HH:mm:ss tt') AS custom_format
FROM   sales.orders;

SELECT   format(OrderDate, 'MMM yy') AS OrderDate,
         count(*) AS OrderNumber
FROM     sales.Orders
GROUP BY format(OrderDate, 'MMM yy');

SELECT *
FROM   sales.Employees;

SELECT   employeeid,
         birthdate,
         getdate() AS current_date_today,
         DATEDIFF(year, birthdate, GETDATE()) AS employee_age
FROM     sales.employees
WHERE    DATEDIFF(year, birthdate, GETDATE()) >= 40
ORDER BY DATEDIFF(year, birthdate, GETDATE()) DESC;

SELECT *
FROM   sales.Orders;

SELECT   format(orderdate, 'MMMM'),
         avg(datediff(day, OrderDate, ShipDate)) AS [days required to ship]
FROM     sales.orders
GROUP BY format(orderdate, 'MMMM');

SELECT   year(orderdate) AS [Year],
         format(orderdate, 'MMMM') AS [Month],
         avg(datediff(day, OrderDate, ShipDate)) AS [Avg Shipping Days]
FROM     sales.orders
GROUP BY year(orderdate), month(orderdate), format(orderdate, 'MMMM')
ORDER BY month(orderdate) ASC;

SELECT   YEAR(orderdate) AS [Year],
         FORMAT(orderdate, 'MMMM') AS [Month],
         AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS [Avg Shipping Days]
FROM     Sales.Orders
GROUP BY YEAR(orderdate), MONTH(orderdate), FORMAT(orderdate, 'MMMM')
ORDER BY YEAR(orderdate), MONTH(orderdate) ASC;

SELECT orderid,
       orderdate,
       lag(Orderdate) OVER (ORDER BY ORDERDATE) AS [Previous Order Date],
       datediff(day, lag(Orderdate) OVER (ORDER BY ORDERDATE), orderdate) AS [Date Diff]
FROM   sales.Orders;

SELECT orderid,
       FORMAT(orderdate, 'MMM') AS [Month],
       orderdate,
       LAG(orderdate) OVER (ORDER BY orderdate) AS [Previous Order Date],
       DATEDIFF(DAY, LAG(orderdate) OVER (ORDER BY orderdate), orderdate) AS [Date Diff]
FROM   sales.Orders;

