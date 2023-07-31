SELECT MAX(length) AS max_duration, MIN(length) AS min_duration, 
ROUND(AVG(length)) min_avg_duration, ROUND(AVG(length)/60) as hour_min_duration
FROM sakila.film;

SELECT DATEDIFF(max(rental_date), min(rental_date)) AS Days_Operating
FROM sakila.rental;

SELECT *, MONTHNAME(rental_date) as Month_Name, DAYNAME(rental_date) as Weekday
FROM sakila.rental;

Select *, 
CASE
	WHEN weekday(rental_date) <= 5 THEN 'Workday'
    ELSE 'Weekday'
END AS Day_Type
FROM sakila.rental;

SELECT title, rental_duration,
CASE 
	WHEN rental_duration = NULL THEN 'Not Available'
    Else rental_duration
END AS rental_time 
FROM sakila.film;

SELECT CONCAT(last_name,' ', first_name, ' email: ',LEFT(email,3)) as full_name
FROM sakila.customer
ORDER BY full_name;

SELECT rating, COUNT(title) 
FROM sakila.film
GROUP BY rating
ORDER BY COUNT(Title) DESC;

SELECT sakila.staff.first_name, COUNT(sakila.rental.staff_id)
FROM sakila.rental
INNER JOIN sakila.staff
ON sakila.rental.staff_id = sakila.staff.staff_id
GROUP BY sakila.rental.staff_id;

SELECT rating, ROUND(AVG(length),2) as average
FROM sakila.film
GROUP BY rating
ORDER BY average DESC;


SELECT rating, ROUND(AVG(length),2)>120 as average
FROM sakila.film
GROUP BY rating
ORDER BY average DESC;

SELECT last_name, COUNT(last_name) as count
FROM sakila.actor
GROUP BY last_name
HAVING count = 1;
-- the difference between having and where is that where happens before the group by and having happens after 

DROP TABLE IF EXISTS sakila.temp; 
CREATE TEMPORARY TABLE sakila.temp
SELECT last_name, count(*) as nb_of_occ FROM sakila.actor 
GROUP BY last_name;
SELECT * FROM sakila.temp WHERE nb_of_occ = 1;










