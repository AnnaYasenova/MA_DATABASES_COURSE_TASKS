select * from sakila.customer;
select first_name, last_name, email from sakila.customer;
select district, address, postal_code from sakila.address order by district, address desc;
select title, rental_rate from sakila.film where rental_rate>3;
select title, description, rating from sakila.film where rating="G" or rating="PG" or rating="R";
select * from sakila.film where rental_duration=3 and replacement_cost<12;
select * from sakila.film where rating="G" and replacement_cost>15;
select * from sakila.film where length>=60 and length<=90