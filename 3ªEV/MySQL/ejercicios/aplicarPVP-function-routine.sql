CREATE DEFINER=`root`@`localhost` FUNCTION `aplicarPVP`(importeOriginal DOUBLE, impuesto DOUBLE) RETURNS int
BEGIN
	DECLARE pvp DOUBLE;
    SET pvp = importeOriginal * (1+(impuesto/100));
RETURN pvp;
END