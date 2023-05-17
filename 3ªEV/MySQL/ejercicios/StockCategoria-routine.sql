CREATE DEFINER=`root`@`localhost` PROCEDURE `StockCategoria`(categoria INT, OUT total INT)
BEGIN
	SELECT SUM(UnitsInStock)INTO total FROM products WHERE categoryID=1;
END