-- Query 1: Select customer and staff information along with the sum of payments made by each customer. Filter the results to include only those customers whose total payment amount falls between 50 and 100. Then, order the results by the total payment amount.
USE SAkILA;

SELECT 
    customer.customer_id, customer.first_name, customer.last_name, 
    staff.first_name, staff.last_name, SUM(amount) AS kaina
FROM 
    customer 
LEFT JOIN 
    payment USING(customer_id) 
LEFT JOIN 
    staff USING(staff_id) 
GROUP BY 
    customer_id
HAVING 
    SUM(amount) BETWEEN 50 AND 100
ORDER BY 
    kaina; 

-- Query 2: Classify payment amounts into three categories: "Minimalus" for amounts less than or equal to 2, "Vidutinis" for amounts between 2 and 6.99, and "Didesnis nei vidutinis" for amounts greater than 6.99.
SELECT 
    payment.amount, 
    CASE
        WHEN payment.amount <= 2 THEN "Minimalus" 
        WHEN payment.amount > 6.99 THEN "Didesnis nei vidutinis" 
        ELSE "Vidutinis" 
    END AS "mokestis"
FROM 
    payment;

-- Query 3: Classify film lengths into four categories based on their duration. Then, select the title, length, and the category of each film length.
USE SAkILA;

SELECT 
    title, length, 
    CASE
        WHEN length <= 60 THEN "Iki valandos" 
        WHEN length > 60 AND length <= 120 THEN "Iki dviejų valandų"
        WHEN length > 120 AND length <= 180 THEN "Iki trijų valandų"
        ELSE "Virš trijų valandų" 
    END AS "ilgumas"
FROM 
    film;

-- Query 4: Count the number of customers whose last name starts with certain letters and categorize them accordingly.
USE SAkILA;

SELECT 
    COUNT(last_name), 
    CASE
        WHEN (last_name LIKE "A%" OR last_name LIKE "B%")  THEN "A-B" 
        WHEN (last_name LIKE "C%" OR last_name LIKE "D%") THEN "C-D"
        WHEN (last_name LIKE "E%" OR last_name LIKE "F%") THEN "E-F"
        ELSE "Visi kiti" 
    END AS "vardas"
FROM 
    customer
GROUP BY 
    vardas;

-- Query 5: Classify customers into segments based on their payment amount ranges and count the number of customers and the total amount spent in each segment.
USE SAkILA;

SELECT 
    COUNT(customer_id) AS klientu_sk, 
    SUM(total) AS money, 
    segmentas 
FROM 
    (SELECT 
         customer_id, 
         SUM(amount) AS total, 
         CASE 
             WHEN SUM(amount) <= 50 THEN 'taupūs klientai' 
             WHEN SUM(amount) > 50 AND SUM(amount) <=100 THEN 'išleidžiantys vidutiniškai' 
             ELSE 'išleidžiantys daug' 
         END AS segmentas 
     FROM 
         payment 
     GROUP BY 
         customer_id) Klientu_segmentavimas 
GROUP BY 
    segmentas; 

-- Query 6: Select customers from Spain or France and categorize them as "Ispanas" or "Prancūzas" respectively.
USE SAkILA;

SELECT 
    CONCAT(customer.first_name,' ',customer.last_name) AS customer, 
    country.country, 
    CASE 
        WHEN country.country = 'Spain' THEN 'Ispanas' 
        WHEN country.country = 'France' THEN 'Prancūzas' 
    END AS nationality 
FROM 
    customer  
LEFT JOIN 
    address USING(address_id) 
LEFT JOIN 
    city USING(city_id) 
LEFT JOIN 
    country USING(country_id) 
WHERE 
    country.country = 'Spain' OR country.country = 'France';

-- Query 7: Count the number of customers from Spain or France and categorize them as "Ispanas" or "Prancūzas" respectively.
USE SAkILA;

SELECT 
    COUNT(CONCAT(customer.first_name,' ',customer.last_name)) AS customer, 
    country.country, 
    CASE 
        WHEN country.country = 'Spain' THEN 'Ispanas' 
        WHEN country.country = 'France' THEN 'Prancūzas' 
    END AS nationality 
FROM 
    customer  
LEFT JOIN 
    address USING(address_id) 
LEFT JOIN 
    city USING(city_id) 
LEFT JOIN 
    country USING(country_id) 
WHERE 
    country.country = 'Spain' OR country.country = 'France'
GROUP BY 
    country;

-- Query 8: Query not provided.

-- Query 9: Classify customers based on their payment amount ranges and display their first name, last name, payment amount, and the classification.
USE SAkILA;

SELECT 
    first_name, last_name, amount, 
    CASE
        WHEN payment.amount <= 2 THEN "Minimalus" 
        WHEN payment.amount > 6.99 THEN "Didesnis nei vidutinis" 
        ELSE "Vidutinis" 
    END AS "mokescio tipas"
FROM 
    customer
LEFT JOIN 
    payment USING(customer_id)
ORDER BY 
    amount;

-- Query 10: Select film ID, title, rental rate, and the count of rentals for films with the maximum rental rate.
USE SAkILA;

SELECT 
    film.film_id, film.title, film.rental_rate, COUNT(rental.inventory_id) AS 'Number of rental' 
FROM 
    film 
LEFT JOIN 
    inventory ON inventory.film_id=film.film_id 
LEFT JOIN 
    rental ON rental.inventory_id=inventory.inventory_id 
WHERE 
    rental_rate = (SELECT MAX(rental_rate) FROM film) 
GROUP BY 
    film.film_id 
ORDER BY 
    COUNT(rental.inventory_id) ASC; 

-- Query 11: Select customer first name, last name, and payment amount for customers whose payment amount matches the maximum payment amount in the payment table.
USE SAkILA;

SELECT 
    customer.first_name, customer.last_name, payment.amount 
FROM 
    customer 
LEFT JOIN 
    payment ON payment.customer_id=customer.customer_id 
WHERE 
    payment.amount = (SELECT MAX(amount) FROM payment); 
