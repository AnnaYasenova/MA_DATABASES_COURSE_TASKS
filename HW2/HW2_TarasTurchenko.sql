-- Task 1
-- Вивести адресу і місто до якого відноситься ця адреса,
-- у яких незаповнені phone або postal_code. (таблиці address, city).

-- JOIN
select
    a.address_id as 'ID',
    a.address as 'Address',
    c.city as 'City'
from address a
join city c on c.city_id = a.city_id
where a.phone = '' or a.postal_code = ''
order by a.address_id;

-- SUB-QUERY
select
    a.address_id as 'ID',
    a.address as 'Address',
    (
        select c.city from city c
        where c.city_id = a.city_id
    ) as 'City'
from address a
where a.phone = '' or a.postal_code = '';



-- Task 2
-- Вивести список міст Аргентини і Австрії (таблиці city, country).
-- Відсортувати за алфавітом.

-- JOIN
select c.city_id as 'ID', c.city as 'City' from city c
join country c2 on c2.country_id = c.country_id
where c2.country in ('Argentina', 'Austria')
order by c.city;

-- SUB-QUERY
select c.city_id as 'ID', c.city as 'City' from city c
where c.country_id in (
    select c2.country_id from country c2
    where c2.country in ('Argentina', 'Austria')
)
order by c.city;



-- Task 3
-- Вивести список акторів, що знімалися в фільмах категорій Music, Sports.
-- (використати таблиці actor, film_actor, film_category, category).

-- JOIN
select distinct
    a.actor_id as 'ID',
    a.first_name as 'First Name',
    a.last_name as 'Last Name'
from film_actor fa
join actor a on fa.actor_id = a.actor_id
join film_category fc on fa.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where c.name in ('Music', 'Sports')
order by a.actor_id;

-- SUB-QUERY
select
    a.actor_id as 'ID',
    a.first_name as 'First Name',
    a.last_name as 'Last Name'
from actor a
where a.actor_id in (
    select fa.actor_id from film_actor fa
    where fa.film_id in (
        select fc.film_id from film_category fc
        where fc.category_id in (
            select c.category_id from category c
            where c.name in ('Music', 'Sports')
        )
    )
);



-- Task 4
-- Вивести прізвища та імена всіх клієнтів (customer),
-- які не повернули фільми в прокат.

-- JOIN
select distinct
    c.customer_id as 'ID',
    c.last_name as 'Last Name',
    c.first_name as 'First Name'
from customer c
join rental r on c.customer_id = r.customer_id
where r.return_date is null
order by c.customer_id;

-- SUB-QUERY
select
    c.customer_id as 'ID',
    c.last_name as 'Last Name',
    c.first_name as 'First Name'
from customer c
where customer_id in (
    select r.customer_id from rental r
    where r.return_date is null
);



-- TASK 5
-- Вивести всі фільми, видані в прокат менеджером Mike Hillyer.
-- Для визначення менеджера використати таблицю staff і поле staff_id;
-- для визначення фільму скористатися таблицею inventory (поле inventory_id),
-- і таблиці film (поле film_id).

-- JOIN
select distinct f.film_id as 'ID', f.title as 'Film' from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join staff s on r.staff_id = s.staff_id
where s.first_name = 'Mike' and s.last_name = 'Hillyer'
order by f.film_id;

-- SUB-QUERY
select f.film_id as 'ID', f.title as 'Film' from film f
where f.film_id in (
    select i.film_id from inventory i
    where i.inventory_id in (
        select r.inventory_id from rental r
        where r.staff_id in (
            select s.staff_id from staff s
            where s.first_name = 'Mike' and s.last_name = 'Hillyer'
        )
    )
);



-- Task 6
-- Вивести користувачів, що брали в оренду фільми SWEETHEARTS SUSPECTS,
-- TEEN APOLLO, TIMBERLAND SKY, TORQUE BOUND.

-- JOIN
select distinct
    c.customer_id as 'ID',
    c.first_name as 'First Name',
    c.last_name as 'Last Name'
from rental r
join inventory i on r.inventory_id = i.inventory_id
join customer c on r.customer_id = c.customer_id
join film f on i.film_id = f.film_id
where f.title in ('SWEETHEARTS SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND')
order by c.customer_id;

-- SUB-QUERY
select
    c.customer_id as 'ID',
    c.first_name as 'First Name',
    c.last_name as 'Last Name'
from customer c
where c.customer_id in (
    select r.customer_id from rental r
    where r.inventory_id in (
        select i.inventory_id from inventory i
        where i.film_id in (
            select f.film_id from film f
            where f.title in ('SWEETHEARTS SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND')
        )
    )
)
order by c.customer_id;



-- Task 7
-- Вивести список фільмів, незданих в прокат, replacement_cost яких більший 10 доларів.

-- JOIN
select distinct f.film_id as 'ID', f.title as 'Film' from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
where f.replacement_cost > 10 and r.return_date is null
order by f.film_id;

-- SUB-QUERY
select f.film_id as 'ID', f.title as 'Film' from film f
where f.replacement_cost > 10 and f.film_id in (
    select i.film_id from inventory i
    where i.inventory_id in (
        select r.inventory_id from rental r
        where r.return_date is null
    )
);



-- Task 8
-- Вивести прізвище та ім'я користувачів (customer),
-- які здійснювали оплату в розмірі більшому,
-- ніж 10 доларів (таблиця payment, поле amount), також вивести amount, дату оплати.
-- Відсортувати за датою оплати.

-- JOIN
select distinct
    c.first_name as 'First Name',
    c.last_name as 'Last Name',
    p.amount as 'Amount',
    p.payment_date as 'Payment Date'
from payment p
join customer c on c.customer_id = p.customer_id
where p.amount > 10
order by p.payment_date;

-- SUB-QUERY
select
    (
        select c.first_name from customer c
        where c.customer_id = p.customer_id
    ) as 'First Name',
    (
        select c.last_name from customer c
        where c.customer_id = p.customer_id
    ) as 'Last Name',
    p.amount as 'Amount',
    p.payment_date as 'Payment Date'
from payment p
where p.amount > 10
order by p.payment_date;
