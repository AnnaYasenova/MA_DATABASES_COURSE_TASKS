select*from sakila.customer

select
first_name as "First Name",
last_name as "Last Name",
email as "Email"
from sakila.customer;

select
address as "Address",
district as "District",
postal_code as "Postal Code"
from sakila.address
order by district asc, address desc;

select
title, 
rental_rate 
from sakila.film
where rental_rate > 3; 

select
title, 
description, 
rating
from sakila.film
where rating = 'G' or 'PG' or 'R';

select * from sakila.film
where rental_duration = 3 and replacement_cost < 12;

select * from sakila.film
where rating = 'G' and replacement_cost > 15;

select * from sakila.film
where length between 60 and 90;



