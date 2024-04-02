-- Query 1: Retrieve the current user.
SELECT USER();

-- Query 2: Create a user named 'saule' if it doesn't already exist and set the password to '123'.
CREATE USER IF NOT EXISTS 'saule' IDENTIFIED BY '123';

-- Query 3: Check if the user 'saule' exists in the MySQL user table.
SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'saule');

-- Query 4: Grant all privileges on all databases and tables to the user 'saule'.
GRANT ALL PRIVILEGES ON *.* TO 'saule';

-- Query 5: Show the grants assigned to the user 'saule'.
SHOW GRANTS FOR 'saule';

-- Query 6: Create a user named 'studentas' with specific limitations on query and update rates.
CREATE USER 'studentas' WITH MAX_QUERIES_PER_HOUR 100 MAX_UPDATES_PER_HOUR 50;

-- Query 7: Alter the limitations of user 'studentas' to allow more updates per hour.
ALTER USER 'studentas' WITH MAX_UPDATES_PER_HOUR 70;

-- Query 8: Grant all privileges on the 'sakila.customer' table to the user 'studentas'.
GRANT ALL PRIVILEGES ON sakila.customer TO studentas;

-- Query 9: Create roles named 'admin' and 'developer'.
CREATE ROLE 'admin', 'developer';

-- Query 10: Grant roles 'admin' and 'developer' to users 'saule' and 'studentas'.
GRANT 'admin', 'developer' TO 'saule', 'studentas';

-- Query 11: Select all users from the MySQL user table.
SELECT * FROM mysql.user;

-- Query 12: Drop the 'developer' role if it exists.
DROP ROLE IF EXISTS developer;

-- Query 13: Create a view named 'calculation' to perform a calculation on the film data.
CREATE VIEW calculation AS
SELECT rental_rate, replacement_cost, rental_rate + replacement_cost AS total
FROM film;

-- Query 14: Revoke all privileges from user 'saule' and grant SELECT privilege on the 'sakila.calculation' view.
REVOKE ALL PRIVILEGES FROM 'saule';
GRANT SELECT ON sakila.calculation TO 'saule';

-- Query 15: Revoke all privileges and grant option from users 'sandra' and 'studentas'.
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'sandra', 'studentas';

-- Query 16: Drop users 'saule' and 'studentas' if they exist.
DROP USER IF EXISTS 'saule', 'studentas';
