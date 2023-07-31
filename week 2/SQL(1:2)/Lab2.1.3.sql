SELECT COUNT(sakila.film.title) as num_films, sakila.category.name as cat
FROM sakila.film 
INNER JOIN sakila.film_category
ON sakila.film.film_id = sakila.film_category.film_id
INNER JOIN sakila.category
ON sakila.film_category.category_id = sakila.category.category_id
Group By sakila.category.name;

SELECT sakila.store.store_id, sakila.city.city, sakila.country.country 
FROM sakila.store 
INNER JOIN sakila.address
ON sakila.store.address_id = sakila.address.address_id
INNER JOIN sakila.city
ON sakila.address.city_id = sakila.city.city_id
INNER JOIN sakila.country
ON sakila.city.country_id = sakila.country.country_id
Group By sakila.store.store_id;

SELECT sakila.store.store_id, CONCAT('dollar ',sum(amount)) as total_revenue
FROM sakila.store
INNER JOIN sakila.staff
ON sakila.store.store_id = sakila.staff.store_id
INNER JOIN sakila.payment
ON sakila.staff.staff_id = sakila.payment.staff_id
GROUP BY store_id;

SELECT ROUND(AVG(length),2) as average, sakila.category.name as category 
FROM sakila.film
INNER JOIN sakila.film_category
ON sakila.film.film_id = sakila.film_category.film_id
INNER JOIN sakila.category
ON sakila.film_category.category_id = sakila.category.category_id
GROUP BY sakila.category.name;

SELECT ROUND(AVG(length),2) as average, sakila.category.name as category 
FROM sakila.film
INNER JOIN sakila.film_category
ON sakila.film.film_id = sakila.film_category.film_id
INNER JOIN sakila.category
ON sakila.film_category.category_id = sakila.category.category_id
GROUP BY sakila.category.name
ORDER BY average DESC LIMIT 5;

select sakila.film.title, count(sakila.rental.inventory_id) as rented_movies
from sakila.film
inner join sakila.inventory
on sakila.film.film_id = sakila.inventory.film_id
inner join sakila.rental 
on sakila.inventory.inventory_id = sakila.rental.inventory_id
group by sakila.film.title
order by rented_movies desc limit 10;

-- title = 'Academy Dinosaur', available_store1


SELECT 'Academy Dinosaur' as movie,
case 
	when count(*)> 0 then 'Available'
    else 'Not Available'
end as Store1
FROM sakila.film
INNER JOIN sakila.inventory
ON sakila.film.film_id = sakila.inventory.film_id
INNER JOIN sakila.store
ON sakila.inventory.store_id = sakila.store.store_id;




