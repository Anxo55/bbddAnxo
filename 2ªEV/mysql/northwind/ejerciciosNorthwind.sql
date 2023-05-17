#1
SELECT * FROM products;

#2
SELECT productID,productName,unitPrice from Products;

#3
SELECT productID,productName,categoryID,unitPrice FROM products WHERE unitPrice between 18 AND 20;
#EJEMPLOS DE CÓMO SACAR EL NOMBRE DE LA CATEOGORÍA CON UN JOIN Y CON UNA SUBCONSULTA
SELECT ProductID,ProductName,categoryName FROM products JOIN categories USING(CategoryID);
SELECT ProductID,ProductName,(SELECT categoryName FROM categories WHERE categoryID=p.categoryID) FROM products p;

#4 ACORDAOS DE LA IMPORTANCIA DEL DUAL

SELECT SYSDATE(),curdate(),current_date() FROM dual;

#5 Consulta optimizada, ENTRA EN EXAMEN, REVISAR TEORÍA

(SELECT CONCAT(LOWER(UPPER(LOWER(UPPER(lastName)))),UPPER(SUBSTRING(firstname,0,0))) FROM Employees LIMIT 0,5)
UNION
(SELECT CONCAT(LOWER(UPPER(LOWER(UPPER(lastName)))),UPPER(SUBSTRING(firstname,0,0))) FROM Employees LIMIT 5,9);

#6 VERSIÓN PARA NOTA, CAERÁ UNA SIMILAR

SELECT UPPER(optimizada.apellido)
FROM (SELECT CONCAT(LOWER(UPPER(LOWER(UPPER(lastName)))),UPPER(SUBSTRING(firstname,0,0))) AS apellido FROM Employees) optimizada;

#7

SELECT substring(firstName,1,3)
FROM employees;

#8

SELECT firstName,LastName,LOWER(CONCAT(SUBSTRING(firstName,1,1),lastName,"@northwind.com")) AS Email
FROM Employees;

#9

SELECT FirstName,LastName,BirthDate,YEAR(curdate())-YEAR(birthdate) AS EDAD_NO_EXACTA,ROUND((DATEDIFF(curdate(),birthdate)/365),0),timestampdiff(YEAR ,birthdate,curdate())  FROM employees;

SELECT YEAR(orderDate),MONTH(orderDate) AS Mes,COUNT(*)
FROM orders GROUP BY YEAR(orderDate),MONTH(orderDate) HAVING MES=3;

SELECT YEAR(orderDate),COUNT(*)
FROM orders
WHERE MONTH(orderDate)=3
GROUP BY YEAR(orderDate);

#10

SELECT country,COUNT(DISTINCT FAX)
FROM customers
GROUP BY country;

#11
#Forma eficiente con subconsulta
SELECT MAX(anhos.antiguedad),MIN(anhos.antiguedad),AVG(antiguedad)
FROM (SELECT hireDate,timestampdiff(YEAR,hiredate,curdate()) AS Antiguedad
 FROM employees) anhos;
 
#Forma menos eficiente calculando en la select todos los datos

SELECT MIN(timestampdiff(YEAR,hiredate,curdate())) AS Rookie,MAX(timestampdiff(YEAR,hiredate,curdate())) AS Senior, AVG(timestampdiff(YEAR,hiredate,curdate())) AS "MEDIA EMPRESA"
FROM employees;

#12

SELECT country,COUNT(*)
FROM customers c1
GROUP BY country
HAVING COUNT(*)=(SELECT COUNT(*) FROM customers c2  WHERE c2.fax="" AND C2.country=c1.country GROUP BY c2.country);

SELECT country,group_concat(DISTINCT fax) AS faxes
FROM customers
GROUP BY country
HAVING faxes="";
 
 #13
 
 SELECT contactName,fax,country FROM customers;
 
 #14
 
 SELECT MAX(TIMESTAMPDIFF(YEAR,birthdate,curdate())) AS OLDEST,MIN(TIMESTAMPDIFF(YEAR,birthdate,curdate()))AS YOUNGEST,ROUND(AVG(TIMESTAMPDIFF(YEAR,birthdate,curdate())),2) AS "AVERAGE AGE" FROM employees;
 
 #15
 
 SELECT YEAR(orderdate),COUNT(*) AS "PEDIDOS" FROM orders GROUP BY YEAR(orderdate);
 
 #16
 
 SELECT orderID,freight FROM orders;
 
 #17
 
  SELECT orderID,freight FROM orders WHERE freight>10;
  
  #18
  
  SELECT categoryName,COUNT(*) AS "Número de productos"
  FROM products JOIN categories USING(categoryID)
  GROUP BY categoryID
  HAVING COUNT(*)>10;

#19

SELECT productName,categoryName
FROM products JOIN categories USING(categoryID);

#20

SELECT c.companyName, CONCAT(e.firstName," ",e.lastName) AS Vendedor
FROM orders o JOIN employees e USING(employeeID) JOIN customers c ON o.customerID=c.customerID
ORDER BY e.employeeId;

#21

SELECT CompanyName,contactName, country,orderId,orderDate
FROM customers JOIN orders USING(customerId)
ORDER BY 1,5 DESC;

#22

SELECT c.customerId,c.companyName,SUM(od.quantity*od.unitPrice)
FROM orders o JOIN orderDetails OD USING(orderID) JOIN customers c USING(customerId)
GROUP BY c.customerID
ORDER BY 3 DESC
LIMIT 5;

#23

SELECT CONCAT(e.firstName," ",e.lastName) AS "Nombre empleado",regionId AS "Código región",territoryDescription AS "Descripción del territorio"
FROM employees e JOIN employeeTerritories et USING(employeeID) JOIN territories t USING(territoryId)
ORDER BY 1;





