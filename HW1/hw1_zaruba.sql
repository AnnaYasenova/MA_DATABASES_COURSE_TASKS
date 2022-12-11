# Виведіть вміст таблиці customer
select * from customer;

# З таблиці customer виведіть лише ім’я, прізвище та електронну пошту.
# В результуючій таблиці колонки мають називатися “First Name”, “Last Name”, “Email”.

select
    first_name as "First Name",
    last_name as "Last Name",
    email as "Email"
from customer;

# З таблиці address виведіть колонки address, district, postal_code.
# Назви в результуючому запиті: “Address”, “District”, “Postal Code”.
# Відсортуйте результат за колонкою district (за зростанням) та address (за спаданням).

select
    address as "Address",
    district as "District",
    postal_code as "Postal Code"
from address
ORDER BY district, address DESC;

# З таблиці фільмів виведіть назву фільму і ціну прокату таких фільмів, ціна прокату яких більша ніж 3 долари.
select
    title,
    rental_rate
    from film
where rental_rate > 3;

# З таблиці фільмів виведіть інформацію про фільми з рейтингом “G”, “PG”, “R”.
# Колонки які потрібно вивести: назва, опис і рейтинг.
select
    title,
    description,
    rating
from film
where rating in ('G', 'PG', 'R');

# Виведіть всю інформацію про фільми, в яких тривалість прокату рівна 3, а replacement_cost менша ніж 12 доларів.
select * from film
where rental_duration = 3 and replacement_cost < 12;

# Виведіть всю інформацію про фільми з рейтингом “G” і replacement_cost більшою ніж 15 доларів
select * from film
where rating = 'G' and replacement_cost > 15;

# Виведіть всю інформацію про фільми з тривалість від 60 до 90 хвилин включно.
select * from film
where length between 60 and 90;