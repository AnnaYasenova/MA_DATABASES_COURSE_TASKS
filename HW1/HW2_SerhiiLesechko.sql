-- 1
select address, city from sakila.address
join sakila.city on sakila.address.city_id = sakila.city.city_id
where phone in ("", null) or postal_code in ("", null);

-- 2
select city, country from sakila.city
join sakila.country on sakila.city.country_id = sakila.country.country_id
where country in ("Argentina", "Austria")
order by city asc;

-- 3
select distinct first_name, last_name from sakila.actor
join sakila.film_actor on sakila.actor.actor_id = sakila.film_actor.actor_id
join sakila.film_category on sakila.film_actor.film_id = sakila.film_category.film_id
join sakila.category on sakila.film_category.category_id = sakila.category.category_id
where sakila.category.name in ("Music", "Sports")
order by first_name asc;

-- 4
select first_name, last_name from sakila.rental
join sakila.customer on sakila.rental.customer_id = sakila.customer.customer_id
where return_date is null
order by first_name asc;

-- 5
select distinct title from sakila.staff
join sakila.inventory on sakila.staff.staff_id = sakila.inventory.store_id
join sakila.film on sakila.inventory.film_id = sakila.film.film_id
where sakila.staff.first_name = "Mike" and sakila.staff.last_name = "Hillyer";

-- 6
select distinct first_name, last_name from sakila.film
join sakila.inventory on sakila.film.film_id = sakila.inventory.film_id
join sakila.rental on sakila.inventory.inventory_id = sakila.rental.inventory_id
join sakila.customer on sakila.rental.customer_id = sakila.customer.customer_id
where title in ("SWEETHEARTS SUSPECTS", "TEEN APOLLO", "TIMBERLAND SKY", "TORQUE BOUND")
order by first_name, last_name;

-- 7
select distinct title, replacement_cost from sakila.film
join sakila.inventory on sakila.film.film_id = sakila.inventory.film_id
join sakila.rental on sakila.inventory.inventory_id = sakila.rental.inventory_id
join sakila.payment on sakila.rental.rental_id = sakila.payment.rental_id
join sakila.customer on sakila.payment.customer_id = sakila.customer.customer_id
where return_date is null and replacement_cost > 10
order by title;

-- 8
select first_name, last_name, payment_date from sakila.customer
join sakila.payment on sakila.customer.customer_id = sakila.payment.customer_id
where amount > 10
order by payment_date asc;
