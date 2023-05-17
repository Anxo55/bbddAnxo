##1 ¿Dónde vive 'JUDY GRAY'?
SELECT CONCAT(c.first_name," ",c.last_name) AS Nombre,ci.city AS Ciudad
FROM customer c JOIN address a ON c.address_id=a.address_id JOIN city ci USING(city_id)
WHERE first_name='JUDY' AND last_name='GRAY';
##2 ¿En cuántos países viven nuestros clientes? (países distintos)

SELECT COUNT(DISTINCT co.country_id) AS "PAISEES CLIENTES"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id);


SELECT COUNT(DISTINCT co.country_id) AS "PAISEES CLIENTES"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE c.customer_ID is NULL;

##3 ¿Cuántos clientes viven en Egipto?
SELECT COUNT(*) AS "Clientes egipcios"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT';

SELECT COUNT(*) AS "Clientes egipcios", GROUP_CONCAT(CONCAT(city) separator ',')
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT';

##4	¿En qué ciudades de Egipto viven nuestros clientes?

SELECT DISTINCT ci.city_id,ci.city, COUNT(*)
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT'
GROUP BY ci.city_id;

SELECT DISTINCT ci.city_id,ci.city, COUNT(*)
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT'
GROUP BY ci.city_id;

##5 ¿Cuántos clientes viven fuera de Estados Unidos? (UNITED STATES)
SELECT COUNT(*) AS "Clientes no americanos"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE co.country<>'UNITED STATES';

##6 Cuántas películas duran 90 o menos minutos?
SELECT COUNT(*)
FROM film
WHERE length<=90;

#7 Cuántas películas van de astronautas?
SELECT *
FROM film f
WHERE f.description LIKE "%ASTRONAUT%" AND length<=90;

SELECT *
FROM customer
WHERE first_name LIKE "A%";

SHOW CREATE TABLE film;

#9 Lista los títulos de todas las películas, ordenadas por duración, de forma descendente.
SELECT title, length 
FROM film
ORDER BY length DESC;

SELECT *
FROM film 
WHERE length=(SELECT MAX(length) FROM film);

#10 Visualiza los 10 actores que han participado en más películas.
SELECT first_name, last_name FROM customer;

SELECT CONCAT(first_name,'.',last_name,"@cebem.es") AS correoE
FROM customer;

SELECT LOWER(CONCAT(SUBSTRING(first_name,1,1),last_name"@cebem.es"))
FROM customer;

#11 Visualiza los clientes de países que empiezan por S.

SELECT customer_id,first_name,last_name,email,active FROM customer;
 

#12 Visualiza el top-10 de países con más clientes

SELECT DISTINCT ci.city_id,ci.city,co.country
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id);








