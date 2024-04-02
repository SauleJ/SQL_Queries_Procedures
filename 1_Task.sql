-- 1. Selects the first name and last name of actors from the 'actor' table in the 'sakila' database,
-- and orders the results by the first name.
SELECT first_name, last_name
FROM sakila.actor
ORDER BY first_name;

-- 2. Selects all columns from the 'actor' table in the 'sakila' database
-- where the first name is "NICK".
SELECT *
FROM sakila.actor
WHERE first_name = "NICK";

-- 3. Selects the title, rental rate, and rental duration of films from the 'film' table in the 'sakila' database
-- where the rental duration is 6, and orders the results by rental rate in descending order.
SELECT title, rental_rate, rental_duration
FROM sakila.film
WHERE rental_duration = 6
ORDER BY rental_rate DESC;

-- 4. Selects the title, rental rate, and rental duration of films from the 'film' table in the 'sakila' database
-- where the rental duration is 3 and the rental rate is the minimum rental rate in the 'film' table.
SELECT title, rental_rate, rental_duration
FROM sakila.film
WHERE rental_duration = 3
AND rental_rate = (SELECT MIN(rental_rate) FROM sakila.film);

-- 5. Selects the title and rental rate of films from the 'film' table in the 'sakila' database
-- where the title is "LADY STAGE".
SELECT title, rental_rate
FROM sakila.film
WHERE title = "LADY STAGE";

-- 6. Selects the customer ID and the total amount of payments made by the customer with ID 15
-- from the 'payment' table in the 'sakila' database, and sums the amounts.
SELECT customer_id, SUM(amount)
FROM sakila.payment
WHERE customer_id = 15;

-- 7. Counts the number of payments made by customer with ID 10
-- from the 'payment' table in the 'sakila' database.
USE sakila; -- Switches to the 'sakila' database
SELECT customer_id AS "Kliento ID",
COUNT(customer_id) AS "Mokėjimų sk."
FROM payment
WHERE customer_id = 10;

-- 8. Selects the customer ID, amount of payment, and payment date
-- from the 'payment' table in the 'sakila' database.
USE sakila; -- Switches to the 'sakila' database
SELECT customer_id AS "Kliento kodas",
amount AS "Atliktas mokėjimas",
payment_date AS "Mokėjimo data"
FROM payment;
