USE MyDatabase;

SELECT *
FROM   customers;

SELECT first_name,
       country,
       concat(first_name, '-', country) AS pair,
       len(first_name) AS name_length
FROM   customers;

SELECT lower(first_name) AS lower_name,
       upper(country) AS upper_country
FROM   customers;

SELECT first_name
FROM   customers
WHERE  first_name != trim(first_name);

SELECT '123-455-2005' AS phone,
       replace('123-455-2005', '-', '/') AS replaced,
       replace('123-455-2005', '-', '') AS clean_phone;

SELECT 'data.txt' AS txt_file,
       replace('data.txt', 'txt', 'pdf') AS pdf_file;

SELECT first_name,
       LEFT(first_name, 2) AS first_two_char,
       RIGHT(first_name, 2) AS last_two_char,
       substring(first_name, 2, 3) AS name_substring
FROM   customers;

SELECT first_name,
       substring(trim(first_name), 2, len(first_name)) AS name_substring
FROM   customers;

SELECT 6.5637 AS number,
       round(6.5637, 0) AS round_0,
       round(6.5637, 1) AS round_1,
       round(6.5637, 2) AS round_2,
       floor(6.5637) as to_floor,
       ceiling(6.5637) as to_ceiling,
       abs(-19) as absolute_val;

