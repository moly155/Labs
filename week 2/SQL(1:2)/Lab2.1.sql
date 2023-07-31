SHOW TABLES FROM sakila;

SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;
SELECT * FROM sakila.customer;

SELECT title, name AS Language_Used_In_Films, first_name
FROM sakila.film
INNER JOIN sakila.language
ON sakila.film.language_id = sakila.language.language_id
INNER JOIN sakila.inventory
ON sakila.film.film_id = sakila.inventory.film_id
INNER JOIN sakila.staff
ON sakila.inventory.store_id = sakila.staff.store_id;

SELECT DISTINCT release_year 
FROM sakila.film;

SELECT COUNT(DISTINCT sakila.staff.store_id) AS number_of_stores, COUNT(DISTINCT sakila.staff.staff_id) AS number_of_employees, COUNT(DISTINCT sakila.rental.rental_id) as n_films_rented, 
COUNT(DISTINCT sakila.inventory.inventory_id) as n_films_available, COUNT(DISTINCT sakila.actor.last_name)
FROM sakila.store
INNER JOIN sakila.staff
ON sakila.store.store_id = sakila.staff.store_id
INNER JOIN sakila.rental
ON sakila.staff.staff_id = sakila.rental.staff_id
INNER JOIN sakila.inventory
ON sakila.rental.inventory_id = sakila.inventory.inventory_id
INNER JOIN sakila.film_actor
ON sakila.inventory.film_id = sakila.film_actor.film_id
INNER JOIN sakila.actor
ON sakila.film_actor.actor_id = sakila.actor.actor_id;

SELECT title 
FROM sakila.film 
ORDER BY length DESC
LIMIT 10;

SELECT CONCAT(first_name,' ',last_name) AS Scarletts
FROM sakila.actor
WHERE first_name = 'SCARLETT';

SELECT title
FROM sakila.film 
WHERE length>100 AND title LIKE '%ARMAGEDDON%'  ;
-- where title regexp 'ARMAGEDDON' also works 

SELECT COUNT(title) AS behind_the_scenes
FROM sakila.film
WHERE special_features = 'Behind the Scenes';

-- 5.3

 
