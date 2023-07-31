-- 1 Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

select title, count(*) as nb_copies
from sakila.film 
inner join sakila.inventory
on sakila.film.film_id = sakila.inventory.film_id
where sakila.film.title = "Hunchback Impossible"
group by title;

-- using subqueries 

select film_id, count(*) as nb_copies
from sakila.inventory 
where film_id = (select film_id from sakila.film where title = "Hunchback Impossible")
group by film_id;

-- 2 List all films whose length is longer than the average length of all the films in the Sakila database.

select title, length 
from sakila.film 
where length > (select avg(length) from sakila.film);

-- 3 Use a subquery to display all actors who appear in the film "Alone Trip".

select title, GROUP_CONCAT(first_name,' ', last_name) as Name 
from sakila.film 
inner join sakila.film_actor 
on sakila.film.film_id = sakila.film_actor.film_id
inner join sakila.actor
on sakila.film_actor.actor_id = sakila.actor.actor_id
where title = 'Alone Trip'
GROUP BY title;

-- using subqueries 

select film_id as 'Alone Trip' , group_concat(first_name,' ', last_name) as Name 
from sakila.film_actor
inner join sakila.actor
on sakila.film_actor.actor_id = sakila.actor.actor_id
where film_id = (select film_id 
from sakila.film
where title = 'Alone Trip')
group by film_id;

-- 4 Identify all movies categorized as family films.

select sakila.category.name, group_concat(title)
from sakila.film 
inner join sakila.film_category
on sakila.film.film_id = sakila.film_category.film_id
inner join sakila.category
on sakila.film_category.category_id = sakila.category.category_id
where sakila.category.name = 'Family'
Group by sakila.category.name;


-- use subqueries 

select category_id, group_concat(title)
from sakila.film_category 
inner join sakila.film
on sakila.film.film_id = sakila.film_category.film_id
where sakila.film_category.category_id = (select sakila.category.category_id from sakila.category where category.name = 'Family')
group by category_id;

-- 5 Retrieve the name and email of customers from Canada using both subqueries and joins.

select sakila.customer.first_name, sakila.customer.last_name, email 
from sakila.customer
inner join sakila.address
on sakila.customer.address_id = sakila.address.address_id
inner join sakila.city 
on sakila.address.city_id = sakila.city.city_id
where country_id = (select country_id from sakila.country where country = 'Canada');

-- 6 Determine which films were starred by the most prolific actor in the Sakila database.

select actor_id, count(sakila.film_actor.film_id) as nb_films, group_concat(title, ' ') 
from sakila.film
inner join sakila.film_actor
on sakila.film.film_id = sakila.film_actor.film_id
group by sakila.film_actor.actor_id
having count(sakila.film_actor.film_id) = (select max(nb_films) from (select count(sakila.film_actor.film_id) as nb_films from sakila.film_actor group by actor_id) as max_counts);

-- 7 Find the films rented by the most profitable customer in the Sakila database

select sakila.film.title
from sakila.film 
inner join sakila.inventory 
on sakila.film.film_id = sakila.inventory.film_id
inner join sakila.rental
on sakila.inventory.inventory_id = sakila.rental.inventory_id
where sakila.rental.customer_id = (
select sakila.payment.customer_id 
from sakila.payment 
group by sakila.payment.customer_id
order by sum(sakila.payment.amount) desc 
limit 1
);

-- 8 Retrieve the client_id and the total_amount_spent of those 
-- clients who spent more than the average of the total_amount spent by each client.

select customer_id, sum(amount) as total_amount 
from sakila.payment 
group by customer_id
having total_amount > (select sum(amount)/count(*) as average from sakila.payment) 
order by sum(amount) desc
;

