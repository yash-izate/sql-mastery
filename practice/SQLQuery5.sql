USE MyDatabase;

SELECT *
FROM   customers;

INSERT  INTO customers (id, first_name, country, score)
VALUES                (6, 'Anna', 'USA', NULL),
(7, 'Sam', NULL, 100);

INSERT  INTO customers (id, first_name)
VALUES                (8, 'Andreas'),
(9, 'Sarah');

SELECT *
FROM   customers;

INSERT INTO persons (id, name, dob, phone)
SELECT id,
       first_name,
       NULL,
       'Unknown'
FROM   customers;

SELECT *
FROM   persons;

UPDATE customers
SET    score = 0
WHERE  id = 6;

SELECT *
FROM   customers;

UPDATE customers
SET    score   = 0,
       country = 'UK'
WHERE  id = 9;

UPDATE customers
SET    score = 0
WHERE  score IS NULL;

DELETE customers
WHERE  id > 5;

TRUNCATE TABLE persons;