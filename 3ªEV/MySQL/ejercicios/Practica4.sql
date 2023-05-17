##1
SELECT SUM(OD.quantity*OD.UnitPrice) 
	FROM orders O JOIN orderDetails OD USING(orderID)
	WHERE O.CustomerID='VINET';

DESCRIBE customers;

##2
SET @TOTAL=0;
CALL totalCliente('VINET', @TOTAL);

SELECT @TOTAL;

SET GLOBAL log_bin_trust_function_creators=1;
