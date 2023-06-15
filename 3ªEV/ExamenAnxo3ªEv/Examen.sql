#1 Crea un procedimiento almacenado que muestre el nombre y apellido de
# todos los clientes que hayan alquilado la película "ACADEMY DINOSAUR".
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_nombre_y_apellido_pelicula`(OUT nombre VARCHAR(50), OUT apellido VARCHAR(50), OUT pelicula VARCHAR(50))
BEGIN
  SELECT fist_name AS nombre, "", last_name AS Apellido , f.title
  FROM customer c JOIN film f USING (film_id)
  WHERE f.title = 'DINOSAUR ACADEMY';
  
END
#2 Crea una función almacenada que calcule y devuelva el número de actores
# que hay en las base de datos Sakila. 

CREATE FUNCTION numero_de_actores (Nombre CHAR(50), apellido CHAR(50))
RETURNS INTEGER
BEGIN

SELECT co.country AS "País", actor_id AS "Número de actores"
FROM actor JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
GROUP BY co.country_id
ORDER BY 2 DESC
LIMIT 10;
RETURN 1;
END

#3  Crea un procedimiento almacenado que muestre el nombre y apellido de
# todos los clientes que hayan alquilado más de 5 películas.
CREATE DEFINER=`root`@`localhost` PROCEDURE `alquilado_cinco_peliculas`(Nombre CHAR(50), apellido CHAR(50))
BEGIN

SELECT first_name AS Nombre, last_name AS Apellido, film f
FROM rental r JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE film>5;

END
#4 Crea un cursor que recorra todas las peliculas de la base de datos Sakila
# y muestre el título y actualice la duracion de todas sumandole 1 minuto
#  a cada una de ellas.

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualiza_tiempo`()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE film_id INT;
  DECLARE film_tiempo DECIMAL(10,2);
  
  -- Declarar el cursor para recorrer la tabla de productos
  DECLARE films_cursor CURSOR FOR SELECT FilmID, tiempo FROM film;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  -- Abrir el cursor
  OPEN films_cursor;
  
  -- Iniciar el bucle para recorrer los registros
  bucle_films: LOOP
    -- Obtener el siguiente registro del cursor
    FETCH films_cursor INTO film_id, film_tiempo;
    
    -- Salir del bucle si no hay más registros
    IF done THEN
      LEAVE bucle_films;
    END IF;
    
    -- Actualizar el precio del producto en un 10%
    UPDATE films SET tiempo = film_tiempo * 1 WHERE FilmID = film_id;
  END LOOP;
  
  -- Cerrar el cursor
  CLOSE films_cursor;
END

#5 Crea un procedimiento almacenado que muestre el nombre y apellido de
# todos los clientes que hayan alquilado una película en el año 2006.

CREATE DEFINER=`root`@`localhost` PROCEDURE `alquiler_pelicula`(Nombre CHAR(50), apellido CHAR(50))
BEGIN

SELECT first_name AS Nombre, last_name AS Apellido, film f
FROM customer JOIN rental r USING (rental_id) JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE rental_duration BETWEEN "2006-01-01%" AND "2006-12-31%";

END

#6 Crea un cursor que recorra que recorra todas las tiendas de la base 
# de datos  Sakila y muestre el nombre y la direccion de cada una.

#7 Crea un procedimiento almacenado que muestra el nombre y apellido
# de todos los clientes que hayan alquilado una película en el mes
# de diciembre.

#8 Crea una funcion almacenada que calcule el numero de clientes que
# vivan en una ciudad que se pasará como parámetro de la función.

#9 Crea una funcion almacenada que calcule el numero de peliculas para
# un codigo de actor pasado como parámetro.

#10 Crear una funcion que le pasemos el id de una pelicula y nos devuelva
# lo siguiente: 
#    -'Para adultos' Si el rating es 'R'
#	 -'Para todas las edades' Si no lo es.
