
-- Task 1

select
	address,
    (select city from sakila.city
    where sakila.city.city_id = sakila.address.city_id) as city
from sakila.address
where postal_code = '' or phone = '';

select city, address  from sakila.address
join sakila.city using (city_id)
where phone='' or postal_code = '';

-- Task 2

select
    city,
    (select country from sakila.country
    where sakila.city.country_id = sakila.country.country_id) as country
from sakila.city
order by country, city;

select city, country  from sakila.city
join sakila.country using (country_id)
order by country, city;

-- Task 3

 select distinct first_name, last_name from sakila.actor
join sakila.film_actor using (actor_id)
join sakila.film_category using(film_id)
join sakila.category using(category_id)
where name="Music" or name="Sports";

 -- or in this way if I want to know more information, for example in which films actor took part

 select actor_id,  first_name, last_name, film_id, category_id from sakila.film_category
 join sakila.category using (category_id)
 join sakila.film_actor using (film_id)
 join sakila.actor using(actor_id)
 where name = 'Music' or name = 'Sports'
 order by last_name;

 -- Task 4

   select customer_id, rental_id, inventory_id, store_id, first_name, last_name, address_id from sakila.rental as sr
   join sakila.customer using (customer_id)
   where sr.return_date is null
   order by customer_id;

-- Task 5
select  distinct title from sakila.film
join sakila.inventory using(film_id)
join sakila.store using(store_id)
join sakila.staff on  store.manager_staff_id = staff.staff_id
where first_name = 'Mike' and last_name = 'Hillyer'
order by title;

-- Task 6

select distinct first_name, last_name from sakila.customer
join sakila.inventory using (store_id)
join sakila.film using (film_id)
where title in ("SWEETHEARTS SUSPECTS", "TEEN APOLLO", "TIMBERLAND SKY", "TORQUE BOUND")
order by last_name ;

-- Task 7

 select * from (select *, (
 select title from sakila.film as sf
 where sf.film_id = frt.film_id) as title, (
 select replacement_cost from sakila.film as sf
 where sf.film_id = frt.film_id) as replacement_cost from
(select inventory_id,
(select film_id from sakila.inventory as si
	where si.inventory_id = sr.inventory_id) as film_id
from sakila.rental as sr

where return_date is null) as frt) as result
where result.replacement_cost > 10


select si.inventory_id, title, replacement_cost from sakila.film as sf
join sakila.inventory as si on sf.film_id = si.film_id
join sakila.rental as sr on si.inventory_id = sr.inventory_id
where return_date is null and replacement_cost > 10


-- Task 8

select customer_id,  (
	select first_name from sakila.customer as sc
    where sc.customer_id=sp.customer_id) as first_name,(
	select  last_name from sakila.customer as sc
    where sc.customer_id=sp.customer_id) as last_name,
    amount, payment_date
from sakila.payment as sp
where amount > 10
order by payment_date


select first_name, last_name, amount, payment_date from sakila.customer as sc
join sakila.payment as sp on sc.customer_id= sp.customer_id
where sp.amount > 10
order by payment_date