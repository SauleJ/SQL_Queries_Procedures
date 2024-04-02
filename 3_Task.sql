-- Query 1: Retrieve the title and length of the film with the maximum length.
SELECT title, length
FROM film
WHERE length = (SELECT MAX(length) FROM film);

-- Query 2: Retrieve the title, film ID, and number of units available in inventory for each film, ordered by the number of units in descending order.
SELECT film.title, filmu_vnt.film_id, filmu_vnt.vienetai 
FROM (
    SELECT film_id, COUNT(inventory_id) AS vienetai 
    FROM inventory 
    GROUP BY film_id
) AS filmu_vnt 
LEFT JOIN film USING(film_id)
ORDER BY filmu_vnt.vienetai DESC;

-- Query 3: Retrieve the first name, last name, and amount of the payment for customers who made the maximum payment.
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
LEFT JOIN payment USING(customer_id)
WHERE payment.amount = (SELECT MAX(amount) FROM payment);

-- Query 4: Retrieve the title, rental rate, and rental duration of films with a rental duration of 3 and the minimum rental rate.
SELECT title, rental_rate, rental_duration
FROM film
WHERE rental_duration = 3
AND rental_rate = (SELECT MIN(rental_rate) FROM film);

-- Query 5: Retrieve the payment amount for payments made on the earliest payment date by customer "Betty White".
SELECT amount FROM payment
WHERE payment_date = (
    SELECT MIN(payment_date) 
    FROM payment
    LEFT JOIN customer USING(customer_id) 
    WHERE customer.first_name = "Betty" AND customer.last_name = "White"
);

-- Query 6: Retrieve the first name and last name of staff, first name and last name of the customer, and payment amount for payments made by staff member "Mike Hillyer" with the maximum payment amount.
SELECT staff.first_name, staff.last_name, customer.first_name, customer.last_name, payment.amount
FROM staff
LEFT JOIN payment USING(staff_id)
LEFT JOIN customer USING(customer_id)
WHERE staff.first_name = "Mike"  AND staff.last_name = "Hillyer"
AND payment.amount = (SELECT MAX(amount) FROM payment);

-- Query 7: Retrieve the first name and last name of the staff member, first name and last name of the customer for rentals made by staff member "Jon Stephens" on the earliest rental date.
SELECT staff.first_name AS 'darbuotojo vardas', staff.last_name AS 'darbuotojo pavarde', 
customer.first_name as 'kliento vardas', customer.last_name AS 'kliento pavarde' 
FROM customer 
LEFT JOIN rental USING(customer_id) 
LEFT JOIN staff USING(staff_id) 
WHERE DATE(rental.rental_date) = (
    SELECT MIN(DATE(rental.rental_date)) 
    FROM rental 
    LEFT JOIN staff USING(staff_id) 
    WHERE staff.first_name = 'Jon' AND staff.last_name = 'Stephens' 
) 
AND staff.first_name = 'Jon' AND staff.last_name = 'Stephens'; 

-- Query 8: Retrieve the total payment amount and country name for the country with the highest total payment amount.
SELECT SUM(payment.amount) AS Total, country.country 
FROM payment 
LEFT JOIN customer USING(customer_id) 
LEFT JOIN address USING(address_id) 
LEFT JOIN city USING(city_id) 
LEFT JOIN country USING(country_id) 
GROUP BY country.country 
ORDER BY 1 DESC 
LIMIT 1; 

-- Query 9: Retrieve the first name, last name, and total payment amount for customers whose IDs are between 1 and 15, ordered by the total payment amount in descending order.
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total
FROM customer
LEFT JOIN payment USING(customer_id) 
WHERE payment.customer_id BETWEEN 1 AND 15
GROUP BY payment.customer_id
ORDER BY total DESC; 
