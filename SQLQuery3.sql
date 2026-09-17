USE MyDatabase;


SELECT *
FROM   customers;


SELECT first_name,
       country,
       score
FROM   customers;


SELECT *
FROM   customers
WHERE  score != 0;


SELECT first_name,
       country
FROM   customers
WHERE  country = 'Germany';


SELECT   *
FROM     customers
ORDER BY score DESC;


SELECT   *
FROM     customers
ORDER BY country ASC, score DESC;


SELECT   country,
         sum(score) AS total_score
FROM     customers
GROUP BY country;


SELECT   country,
         sum(score) AS total_score,
         count(id) AS total_customer
FROM     customers
GROUP BY country;


SELECT   country,
         sum(score) AS total_score,
         count(id) AS total_customer
FROM     customers
GROUP BY country
HAVING   SUM(score) > 500;


SELECT   country,
         avg(score) AS avg_score
FROM     customers
WHERE    score != 0
GROUP BY country;


