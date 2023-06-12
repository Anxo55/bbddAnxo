#Examen de recuperacion de la segunda evaluación de BBDD.

#1.1 Escribe una consulta para obtener todos los productos de la tabla Productos.

SELECT *
FROM products;

#1.2 Escribe una consulta para obtener el nombre del producto con el precio unitario más alto.

SELECT ProductName, UnitPrice
FROM products
ORDER BY 1
LIMIT 1;

#1.3 Escribe una consulta para obtener el nombre del producto con el mayor número de unidades en stock

SELECT ProductName, UnitsInStock
FROM products;

#1.4 Escribe una consulta para obtener el nombre del producto con mas unidades en pedidos.

SELECT ProductName, QuantityPerUnit
FROM products;

#1.5 Escribe una consulta para obtener la lista de productos(nombre, precio unitario) en orden ascendente
# en funcion del precio.

SELECT ProductName, UnitPrice
FROM products
ORDER BY 2;

#1.6 Escribe una consulta para obtener el nombre del producto y el nombre del proveedor que lo suministra.

SELECT ProductName, ContactName
FROM products p JOIN Suppliers s USING (ContactName);

#1.7 Escribe una consulta para obtener el nombre del producto y numero total de pedidos en los que se ha enviado cada
#producto, ordenados pro número de pedido de mayor a menor

SELECT ProductName, ProductID
FROM products
ORDER BY 2 DESC;

#1.8 Escribe una consulta para obtener el nombre del cliente, el nombre del empleado que lo atendió, la fecha del pedido
# el nombre del producto que se pidió y la cantidad de unidades pedidas. (Pista, el resultado tiene 2155 registros.

#1.9 Crear un informe que muestre todos los codigos de clientes en minúsculas renombrando la columna como "ID".

SELECT LOWER(CustomerID) AS ID
FROM customers;

#1.10 Obtener el numero de pedidos realizados el 21  de mayo de 1996.
 SELECT YEAR(orderdate),COUNT(*) AS "PEDIDOS"
 FROM orders
 GROUP BY YEAR(orderdate);


#1.11 Obtener el nombre, apellidos y país de los empleados que no sean de Estados Unidos
SELECT firstname, lastname,city
FROM Employees
WHERE city NOT LIKE "United States";

#1.12 Obtener la ciudad, nombre de la empresa y nombre de contacto de los clientes de ciudades que tengan la letra
# L en el nombre
SELECT city, CompanyName, ContactName
FROM Customers
WHERE city LIKE "%L%";

#1.13 Obtener el nombre, apellidos y edad de los empleados nacidos en los años 50.


SELECT firstName,lastName,BirthDate,YEAR(curdate())-YEAR(birthdate)
FROM employees
WHERE birthdate BETWEEN "1950-01-01%" AND "1959-12-31%";


#1.14 Obtener el nombre,apellidos y ciudad de los empleados de ciudades distintas de "Seatle"

SELECT firstname, lastname, city
FROM employees
WHERE city <> "Seattle";

#1.15 Crear un informe que muestre el precio unitario medio, el precio total de las unidades en stock y el numero máximo
# de pedidos de la tabla de productos. Todo ellos mostrado como "Precio medio", "Stock total" y "Cantidad maxima en pedido".


#1.16 Obten el nombre de los clientes y el numero total de pedidos de cada cliente para aquellos que hayan hecho pedidos
# a partir del 31 de 1994.

	







