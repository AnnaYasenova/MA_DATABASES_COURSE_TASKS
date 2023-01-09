-- task1
1.Unique actor info,which films and categories of this films,he was act.Datum group by category name,separated by a comma.
2.Customer info,Column 'SID' shows id of store,which customer is serviced.
3.Film info including rating,length and actors,which name and surname consider of all capitalized letter.
4.Film info including rating,length and actors,which name and surname start of capitalized letter.
5.Sum from rented film by customers.
6.Total sales  for each manager and store,where manager works.
7.List of managers including info about them.

-- task2--
create view sakila.vw_film_actor as
select concat(first_name," ",last_name) as full_name,group_concat(fi.title) as film_name from sakila.actor as a
join sakila.film_actor as f on a.actor_id=f.actor_id
join sakila.film as fi on f.film_id=fi.film_id
group by a.first_name,a.last_name;
 
select * from sakila.vw_film_actor;

-- task3--
create view sakila.vw_customer_info as
select concat(first_name," ",last_name) as full_name_customer,c.email as customer_email,a.address as customer_address,ci.city as city,co.country as country from sakila.customer as c
join sakila.address as a on c.address_id=a.address_id
join sakila.city as ci on a.city_id=ci.city_id
join sakila.country as co on ci.country_id=co.country_id
order by first_name; 

select * from sakila.vw_customer_info;

-- task4

create view sakila.vw_film_category_stats as
select count(f.film_id) as amount_of_films,c.name as category_name from sakila.film as f
join sakila.film_category as fc on f.film_id=fc.film_id
join sakila.category as c on fc.category_id=c.category_id
group by c.name;

select * from sakila.vw_film_category_stats;

-- task5
create view sakila.vw_customer_top_payments as
select concat(upper(left(c.first_name,1)),
".",concat(upper(left(c.last_name,1)),lower(substr(c.last_name,2)))) as customer,sum(p.amount) as total_amount from sakila.customer as c
join sakila.payment as p on c.customer_id=p.customer_id
group by c.first_name,c.last_name
having sum(p.amount)>190;

select * from sakila.vw_customer_top_payments;



