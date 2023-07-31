-- Q1 

DROP view IF EXISTS summary_report;
CREATE VIEW summary_report AS
SELECT sakila.customer.customer_id, concat(first_name,' ', last_name) as Name, email, count(*) as rental_count
FROM sakila.customer
inner join sakila.rental
on sakila.customer.customer_id = sakila.rental.customer_id 
group by sakila.customer.customer_id;

select * from summary_report;

-- Q2 

DROP TEMPORARY table IF EXISTS temp_table;
CREATE TEMPORARY TABLE temp_table as
SELECT sakila.payment.customer_id, sum(amount) as total_paid, Name
from summary_report 
inner join sakila.payment 
on summary_report.customer_id = sakila.payment.customer_id 
group by sakila.payment.customer_id
;

select * from temp_table;

-- Q3


WITH cte_name AS (
    SELECT summary_report.Name, summary_report.email, summary_report.rental_count, temp_table.total_paid
    FROM summary_report 
    join temp_table ON summary_report.customer_id = temp_table.customer_id
) 
select Name, email, total_paid, rental_count
from cte_name;

WITH cte_name AS (
    SELECT summary_report.Name, summary_report.email, summary_report.rental_count, 
    temp_table.total_paid, temp_table.total_paid/ summary_report.rental_count as average_payment_per_rental
    FROM summary_report 
    join temp_table ON summary_report.customer_id = temp_table.customer_id
) 
select *
from cte_name;



