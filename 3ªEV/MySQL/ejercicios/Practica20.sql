SELECT customerID, CompanyName, COUNT(orders.orderID), SUM(quantity*UnitPrice)
FROM orders JOIN orderdetails USING(orderID) 
GROUP BY customerID;

CREATE TABLE PedidosClientes(
Id INT PRIMARY KEY AUTO_INCREMENT,
CodCliente CHAR(5),
Nombre VARCHAR(50),
NumeroPedidos INT,
TotalImporte DOUBLE);

SELECT * FROM pedidosClientes