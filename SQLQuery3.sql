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
