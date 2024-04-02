-- Query 1: Retrieve titles and special features of films excluding those with "Trailers" as special features.
USE SAkILA;
SELECT title, special_features
FROM film
WHERE special_features NOT LIKE "%Trailers%";

-- Query 2: Retrieve titles of films starting with the letter 'Z'.
USE SAkILA;
SELECT title
FROM film
WHERE title LIKE 'Z%';

-- Query 3: Retrieve titles, rental rate, replacement cost, and calculate total cost (rental rate + replacement cost) of films.
USE SAkILA;
SELECT title, rental_rate, replacement_cost, (rental_rate + replacement_cost) AS total
FROM film;

-- Query 4: Retrieve customer IDs and return dates of rentals that have not been returned yet.
USE SAkILA;
SELECT customer_id, return_date
FROM rental
WHERE return_date IS NULL;

-- Query 5: Retrieve customer IDs and return dates of rentals that are overdue (return date is before current date).
USE SAkILA;
SELECT customer_id, return_date
FROM rental
WHERE return_date < CURRENT_DATE();

-- Query 6: Retrieve distinct customer IDs and the maximum payment amount across all customers.
USE SAkILA;
SELECT DISTINCT customer_id, (SELECT MAX(amount) FROM payment)
FROM payment;

-- Query 7: Retrieve customer IDs, payment dates formatted as "MM-DD-YYYY", and payment amounts for payments that are the maximum amount for each customer and are greater than or equal to $6.99, ordered by amount in ascending order.
USE SAkILA;
SELECT e.customer_id, DATE_FORMAT(payment_date, '%m-%d-%Y') AS "DATE", amount
FROM payment e
WHERE e.amount = (SELECT MAX(amount) FROM payment f WHERE f.customer_id = e.customer_id)
AND e.amount >= 6.99
ORDER BY amount ASC;
