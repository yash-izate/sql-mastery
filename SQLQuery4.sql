USE MyDatabase;

CREATE TABLE persons (
    id INT NOT NULL,
    name VARCHAR (50) NOT NULL,
    dob DATE,
    phone VARCHAR (15) NOT NULL,
    CONSTRAINT pk_persons UNIQUE (id)
);


SELECT *
FROM   persons;


ALTER TABLE persons
    ADD email VARCHAR (50) NOT NULL;


ALTER TABLE persons 
DROP COLUMN phone;


DROP TABLE persons;