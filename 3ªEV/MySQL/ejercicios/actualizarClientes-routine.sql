CREATE PROCEDURE actualizarClientes()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE categoryId INT;
    DECLARE porcentage DECIMAL(5, 2);

    DECLARE cursores CURSOR FOR
	SELECT CategoryID FROM northwind.products;

   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


    OPEN cursores;

    read_loop: LOOP
 
        FETCH cur INTO categoryId;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        CASE categoryId
            WHEN 1 THEN SET porcentage = 1.01; -- 1% de aumento
            WHEN 2 THEN SET porcentage = 1.02; -- 2% de aumento 
            ELSE SET porcentage = 1; -- Sin aumento
		END CASE;

		
        UPDATE northwind.products
        SET UnitPrice = UnitPrice * porcentage
        WHERE CategoryID = categoryId;
    END LOOP;
	CLOSE cursores;
END