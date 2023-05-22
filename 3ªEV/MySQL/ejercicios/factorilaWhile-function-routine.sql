CREATE DEFINER=`root`@`localhost` FUNCTION `factorialWhile`(numero integer) RETURNS int
BEGIN
	DECLARE factorial INTEGER;
    DECLARE contador INTEGER;
    SET factorial=1, contador=1;
    
	WHILE contador<=numero DO
		SET factorial=factorial*contador;
        SET contador=contador+1;
    END WHILE;
    
RETURN factorial;
END