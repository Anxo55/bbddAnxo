CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalCliente`(codCliente VARCHAR(5), OUT total Double)
BEGIN
	SELECT SUM(OD.quantity*OD.UnitPrice) INTO total
	FROM orders O JOIN orderDetails OD USING(orderID)
	WHERE O.CustomerID='VINET';

END