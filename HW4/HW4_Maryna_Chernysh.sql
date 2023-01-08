--Task1-
'view actor_info: Вюшка, яка дзволяє переглядати список акорів, їхні ПІ, список фільмиів, в яких знімалися та категорію фільмів.'
'view customer_list:  Вюшка з можливістю перегляду повної адреси кастомерів (ІД, імя, адерса, індекс, телеофон, міста, країни) та стутус кастомерів і належність до номеру магазину.'
'view film_list: Повний  список фільмів та деталями про них: назва, опис, ціна, рейтинг, категорія,тривалість , а також повний склад акторів, які там знялися.'
'nicer_but_slower_film_list: та ж сама інформація, лише ПІ акторів вказані прописними літерами'
'sales_by_film_category:  розподіл доходів за категоріями фільмів '
'sales_by_store:  розподіл доходів за магазинами '
'staff_list:  Вюшка з можливістю перегляду повної інформація про  персонал (ІД, імя, адерса, індекс, телеофон, міста, країни) та  належність до номеру магазину '
  
--Task2--
create view sakila.vw_film_actor as 
SELECT title as film_name, concat(first_name, ' ', last_name)  as actor_full_name
FROM sakila.film_actor
join sakila.film using(film_id)
join sakila.actor using(actor_id) ;

--Task3--
create view  sakila.vw_customer_info as 
select  concat(first_name, ' ', last_name)   as customer_full_name, email as customer_email, address, district, city, country 
from sakila.customer 
join sakila.address using (address_id)
join sakila.city using (city_id)
join sakila.country using (country_id)
; 


--Task4--
Create view  sakila.vw_film_category_stats as
Select name as category_name,  count(title) as amount_of_films
from sakila.category
join sakila.film_category using (category_id)
join sakila.film using (film_id)
group by category_name;

--Task5-

create view sakila.vw_customer_top_payments as
select  concat(left(first_name, 1), '. ', last_name) as customer, sum(amount) as total_amount
from sakila.payment
join sakila.customer using (customer_id)
group by first_name, last_name
having  sum(amount) > 190;


select * from sakila.vw_customer_top_payments;