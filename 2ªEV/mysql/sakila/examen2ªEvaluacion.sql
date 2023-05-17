# 2.1 Muestre los nombres y apellidos de todos los actores de la tabla actor.
SELECT CONCAT(first_name , " " ,last_name ) AS Actores
FROM actor;

# 2.2 Devuelve todos los actores cuyos apellidos contengan las letras LI. Esta vez,
#ordene las filas por apellido y nombre, en ese orden.

SELECT last_name AS "apellido", " ", first_name AS "nombre"
FROM actor a
WHERE last_name LIKE '%LI%';

# 2.3 Con IN, muestre las columnas country_id y country de los siguientes países:
#Afganistán, Bangladesh y China
SELECT country_id AS "ID", country AS "Paises"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE co.country='Afganistan'  'Bangladesh'  'China';

# 2.4 Enumere los apellidos de los actores y la cantidad de actores que tienen
# ese apellido, pero solo  para los nombres que comparten al menos
# dos actores.

SELECT ac.actor_id AS ID,CONCAT(a.last_Name) AS Apellido
FROM actor ac JOIN actor a USING(actor_id)
GROUP BY ac.actor_id
ORDER BY 2 DESC LIMIT 3;

# 2.5 Muestre el importe total cobrado por cada trabajador en agosto de 2005
SELECT p.payment_id
FROM customer c JOIN rental r USING(rental_id) JOIN payment p USING(payment_id)
GROUP BY p.payment_id;

#2.6 Liste todas las peliculas y el numero de actores que aparecen en cada película

SELECT f.title AS "Peliculas"
FROM actor JOIN film_actor USING(film_id) JOIN film USING(film_id) 
JOIN inventory i USING(film_id) JOIN rental r USING(rental_id);



# 2.7 ¿Cuantas copias de la película HUNCHBACK IMPOSSIBLE existen en el inventario?
SELECT *
FROM inventory;

# 2.8 Liste los cinco géneros principales en ingresos en orden descendente. (Es posible que necesite utilziar las siguiente tablas:
# category, film_category, inventory, payment y rental.
SELECT p.payment_id AS "Ingresos"
FROM category c JOIN film_category USING(film_id) JOIN film f USING(film_id) 
JOIN inventory i USING(inventory_id) JOIN rental r USING(rental_id) JOIN payment p USING(payment_id)
GROUP BY p.payment_id;



#2.9 Muestre el importe pagado para aquellos clientes de Estados Unidos

SELECT r.rental_id , fc.category_id AS "Código cateogría",ca.name AS "Categoría",COUNT(*) AS "Alquileres"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id) 
JOIN rental r USING(customer_id) JOIN payment pa USING(payment_id) JOIN film_category fc USING(film_id) 
JOIN category ca USING(category_id)

WHERE co.country='UNITED STATES'
GROUP BY fc.category_id
ORDER BY 3 DESC;

#2.10 La musica de Queen y Kris KRistofferson ha visto un resurgimiento impensable. Como consecuencia inesperada, las peliculas
#que comienzan con las letras "K" y "Q" tambien se han disparado en cuanto a alquileres. Use subconsultas para mostrar los titulos
#de peliculas que comienzan con las letras "K" y "Q" cuyo idioma sea el ingles.

SELECT title
FROM film f JOIN film_actor USING(film_id)
WHERE f.film LIKE 'S$'  'K$'
GROUP BY fa.actor_id
ORDER BY 3 DESC LIMIT 10;  


