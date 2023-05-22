CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarNproductos`(numRegistros integer)
BEGIN
	DECLARE contador int DEFAULT 1;
    SET contador=1;
    bucle:REPEAT
		SELECT * FROM products LIMIT contador, 1;
        SET contador=contador+1;
        UNTIL contador>=numregistros
	END REPEAT bucle;
END