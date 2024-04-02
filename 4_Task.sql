-- Query 1: Create a new schema called "test", copy the "customer" table from "sakila" schema to "test" schema, and select all records from the new table.
CREATE SCHEMA test; 
USE test; 
CREATE TABLE Klientai 
SELECT * FROM sakila.customer; 
  
SELECT * FROM Klientai; 

-- Query 2: Select records from the "klientai" table where the first name is 'Linda' and the last name is 'Williams'. Then update the email for the selected record.
USE test;
SELECT * FROM klientai 
WHERE first_name = 'Linda' AND last_name = 'Williams'; 
  
UPDATE Klientai  
SET email = 'linda.williams@gmail.com' 
WHERE first_name = 'Linda' AND last_name = 'Williams'; 

-- Query 3: Select records from the "klientai" table where the first name is 'Jennifer' and the last name is 'Davis'. Then update the address_id for the selected record.
USE test;
SELECT * FROM klientai 
WHERE first_name = 'Jennifer' AND last_name = 'Davis'; 
  
UPDATE Klientai  
SET address_id = '21'
WHERE first_name = 'Jennifer' AND last_name = 'Davis'; 

-- Query 4: Select records from the "klientai" table where the first name is 'Mary' and the last name is 'Smith'. Then delete the selected record.
SELECT * FROM klientai 
WHERE first_name = 'Mary' AND last_name = 'Smith'; 
  
DELETE FROM klientai 
WHERE first_name = 'Mary' AND last_name = 'Smith'; 

-- Query 5: Select all records from the "klientai" table. Then delete records with customer_id between 4 and 6.
SELECT * FROM klientai;
  
DELETE FROM klientai 
WHERE customer_id BETWEEN 4 AND 6; 

-- Query 6: Truncate all records from the "klientai" table.
TRUNCATE TABLE klientai; 

-- Query 7: Drop the "klientai" table.
DROP TABLE klientai; 

-- Query 8: Create a new table called "Nuoma" in the "test" schema by copying the "rental" table from "sakila" schema, and select all records from the new table.
USE test; 
CREATE TABLE Nuoma 
SELECT * FROM sakila.rental; 
  
SELECT * FROM Nuoma; 
