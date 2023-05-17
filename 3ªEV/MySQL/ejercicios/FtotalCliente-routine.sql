CREATE DEFINER=`root`@`localhost` FUNCTION `FtotalClientes`(codigoCliente VARCHAR(5)) RETURNS double
BEGIN
DECLARE total DOUBLE;
	SELECT SUM(OD.quantity*OD.UnitPrice) INTO total
	FROM orders O JOIN orderDetails OD USING(orderID)
	WHERE O.CustomerID=codigoCliente;
RETURN total;
	SELECT SUM(OD.quantity*OD.UnitPrice) INTO total
	FROM orders O JOIN orderDetails OD USING(orderID)
	WHERE O.CustomerID=codigoCliente;
END