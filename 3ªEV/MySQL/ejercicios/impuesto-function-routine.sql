CREATE DEFINER=`root`@`localhost` FUNCTION `impuestos`(precio double, tipoIva int) RETURNS int
BEGIN
	DECLARE precioII double;
    CASE tipoIva
		WHEN 1 THEN SET precioII = precio*1.04;
        WHEN 2 THEN SET precioII = precio*1.1;
        WHEN 3 THEN SET precioII = precio*1.21;
	END CASE;
    RETURN precioII;
RETURN 1;
END