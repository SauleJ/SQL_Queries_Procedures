-- #1 Procedure to retrieve all customers' names and surnames.
USE sakila;
DELIMITER $$
CREATE PROCEDURE AllCustomers()
BEGIN
    SELECT first_name, last_name FROM customer;
END$$
DELIMITER ;

-- Call to execute the 'AllCustomers' procedure.
CALL sakila.AllCustomers();

-- #2 Procedure to retrieve customer names, surnames, and the number of times each customer rented films.

-- #3 Procedure to retrieve the film name based on the film ID.
USE sakila;
DELIMITER $$
CREATE PROCEDURE FilmName(IN ID INT, OUT Film VARCHAR(255))
BEGIN
    SELECT title INTO Film FROM film WHERE film_id = ID;
END$$
DELIMITER ;

-- #4 Procedure to determine the status of a customer (active/passive) based on the customer ID.
USE sakila;
DELIMITER $$
CREATE PROCEDURE Statusas(IN ID INT, OUT Customer_status VARCHAR(255))
BEGIN
    SELECT 
        CASE 
            WHEN active = 1 THEN 'Aktyvus'
            ELSE 'Pasyvus'
        END INTO Customer_status
    FROM customer
    WHERE customer_id = ID;
END$$
DELIMITER ;

-- #5 Procedure to retrieve the minimum payment, maximum payment, and total amount spent on film rentals by a customer based on the customer ID.
USE sakila;
DELIMITER $$
CREATE PROCEDURE Paymentss(IN ID INT, OUT Max_payment INT, OUT Min_payment INT, OUT total INT)
BEGIN
    SELECT MAX(amount) INTO Max_payment FROM payment WHERE customer_id = ID;
    SELECT MIN(amount) INTO Min_payment FROM payment WHERE customer_id = ID;
    SELECT SUM(amount) INTO total FROM payment WHERE customer_id = ID;
END$$
DELIMITER ;
