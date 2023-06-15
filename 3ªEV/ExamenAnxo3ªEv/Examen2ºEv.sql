#1.1 Muestra los actores que tienen de primer nombre 'Scarlett'
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Scarlett%';

#1.2 Muestra una lista de paises que comiencen por 'S'
SELECT country
FROM country
WHERE country LIKE 'S%';

#1.3 Cual es la duracion media de todas las peliculas de la base de datos.
SELECT AVG(peliculas.duracion) AS "Duración media alquiladas"
FROM
(SELECT DISTINCT(f.film_id),f.length AS "duracion"
FROM rental r JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE return_date IS NULL) peliculas;

#1.4 Modifica la consulta anterior para que muestre la duración media por categoria.
SELECT AVG(peliculas.duracion) AS "Duración media alquiladas"
FROM
(SELECT DISTINCT(f.film_id),f.length AS "duracion"
FROM rental r JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE return_date IS NULL) peliculas;

#1.5 Indica si la película "Academy Dinosaur" está disponible para alquiler en la tienda 1.

#1.6 Muestra el número de nombres distintos que tienen los actores.


#1.7 Muestra 10 países con más clientes.
SELECT co.country AS "País",COUNT(c.customer_id) AS "Número de clientes"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
GROUP BY co.country_id
ORDER BY 2 DESC
LIMIT 10;

#1.8 Encuentra el nombre  completo de los clientes y actores de los que
# su primer nombre coincide con el primer nombre del actor con ID 8
# (No se puede emplear el nombre del actor con ID cómo constantes)






