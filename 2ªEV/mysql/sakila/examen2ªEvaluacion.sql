# 2.1 Muestre los nombres y apellidos de todos los actores de la tabla actor.
SELECT CONCAT(first_name , " " ,last_name ) AS Actores
FROM actor;

# 2.2 Devuelve todos los actores cuyos apellidos contengan las letras LI. Esta vez,
#ordene las filas por apellido y nombre, en ese orden.

select first_name as Nombre, last_name as Apellido
from actor a
where last_name like "%LI%"
order by 2,1;

# 2.3 Con IN, muestre las columnas country_id y country de los siguientes países:
#Afganistán, Bangladesh y China
select country_id, country in("Afghanistan","Bangladesh","China") 
from country;

# 2.4 Enumere los apellidos de los actores y la cantidad de actores que tienen
# ese apellido, pero solo  para los nombres que comparten al menos
# dos actores.

SELECT ac.actor_id AS ID,CONCAT(a.last_Name) AS Apellido
FROM actor ac JOIN actor a USING(actor_id)
GROUP BY ac.actor_id
ORDER BY 2 DESC LIMIT 3;

# 2.5 Muestre el importe total cobrado por cada trabajador en agosto de 2005
select concat(s.first_name," ",s.last_name)as nombre, sum(p.amount) as importeTotal, p.payment_date as fechaDePago
from staff s join payment p using(staff_id)
where p.payment_date between "2005-08-01%" and "2005-08-31%"
;

#2.6 Liste todas las peliculas y el numero de actores que aparecen en cada película

select f.title as titulo, count(a.actor_id) as "Numero de actores"
from film f join film_actor fa using(film_id) join actor a using(actor_id)
group by 1;



# 2.7 ¿Cuantas copias de la película HUNCHBACK IMPOSSIBLE existen en el inventario?
select f.title as Título,count(i.inventory_id) as "Número de copias"
from film f join inventory i using(film_id)
where f.title like "Hunchback Impossible"
group by f.title;

# 2.8 Liste los cinco géneros principales en ingresos en orden descendente. (Es posible que necesite utilziar las siguiente tablas:
# category, film_category, inventory, payment y rental.
select ca.name as Categoría, sum(p.amount) as Importe
from category ca join film_category fc using(category_id) join film f using(film_id) join inventory i using(film_id)
join rental r using(inventory_id) join payment p using(rental_id)
group by 1
order by 2 desc
limit 5;



#2.9 Muestre el importe pagado para aquellos clientes de Estados Unidos

select sum(pa.amount) as importe,co.country as país
from country co join city ci using(country_id) join address ad using(city_id) join customer cu using(address_id) join rental ra using(customer_id) join payment pa using(rental_id) 
where co.country like "United States"
group by 2;

#2.10 La musica de Queen y Kris KRistofferson ha visto un resurgimiento impensable. Como consecuencia inesperada, las peliculas
#que comienzan con las letras "K" y "Q" tambien se han disparado en cuanto a alquileres. Use subconsultas para mostrar los titulos
#de peliculas que comienzan con las letras "K" y "Q" cuyo idioma sea el ingles.

select f.title as Título, l.name as Idioma
from film f join language l using(language_id)
where f.title like "K%" || f.title like "Q%" and l.name like "English";


