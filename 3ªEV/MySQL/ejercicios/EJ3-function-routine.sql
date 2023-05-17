CREATE DEFINER=`root`@`localhost` FUNCTION `EJ3function`(resultado VARCHAR(7)) RETURNS int
BEGIN
	DECLARE suma INTEGER;
    SELECT (LEFT(resultado,3) + RIGHT(resultado,3)) INTO suma;
    RETURN suma;
RETURN 1;
END