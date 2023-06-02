/*1 Crea un procedimiento almacenado que reciba dos parametros de entrada(nombre y edad) y los inserte en una tabla llamada personas
que tiene tres columnas (id, nombre, edad). El id es un valor autoincremental DA LA TABLA PERSONAS YA CREADA EN EL EXAMEN*/

CREATE PROCEDURE insertar_persona(IN nombre VARCHAR(50), IN edad INT)
BEGIN
  INSERT INTO personas (nombre, edad) VALUES (nombre, edad);
END;

CREATE TABLE personas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  edad INT
);

/*2 Crea un procedimiento almacenado que reciba un parametro de entrada(id) y devuelva el nombre de la persona correspondiente de 
la tabla clientes*/

CREATE PROCEDURE obtener_nombre_cliente(IN id INT, OUT nombre VARCHAR(50))
BEGIN
  SELECT ContactName INTO nombre FROM clientes WHERE CustomerID = id;
END;

##en principo lo de debajo no
DECLARE @nombreCliente VARCHAR(50)
EXEC ObtenerNombreCliente @id = 1, @nombreCliente = @nombreCliente OUTPUT
SELECT @nombreCliente

/*3 Crea una funcion que reciba un parametro de entrada que es el id del producto y devuelva el numero de unidades vendidas
de ese producto*/

CREATE FUNCTION obtener_unidades_vendidas_producto(id INT) RETURNS INT
BEGIN
  DECLARE unidades_vendidas INT;
  SELECT SUM(Quantity) INTO unidades_vendidas FROM order_details WHERE ProductID = id;
  RETURN unidades_vendidas;
END;

DECLARE @idProducto INT
SET @idProducto = 1 -- ID del producto que deseas consultar

SELECT dbo.ObtenerUnidadesVendidas(@idProducto) AS UnidadesVendidas

/*4 Crea una funcion que reciba un parametro de entrada (id del producto) y devuelva el precio promedio de ese producto en
todos los pedidos*/

CREATE FUNCTION obtener_precio_promedio_producto(id INT) RETURNS DECIMAL(10,2)
BEGIN
  DECLARE precio_promedio DECIMAL(10,2);
  SELECT AVG(UnitPrice) INTO precio_promedio FROM order_details WHERE ProductID = id;
  RETURN precio_promedio;
END;

DECLARE @idProducto INT
SET @idProducto = 1 -- ID del producto que deseas consultar

SELECT dbo.ObtenerPrecioPromedio(@idProducto) AS PrecioPromedio

/*5 Crea un procedimiento almacenado con un cursor que recorra la tabla de productos y muestre por pantalla el nombre y el 
precio de cada producto*/

CREATE PROCEDURE mostrar_nombre_y_precio_productos()
BEGIN
  DECLARE producto_nombre VARCHAR(50);
  DECLARE producto_precio DECIMAL(10,2);
  DECLARE fin_cursor INT DEFAULT 0;
  DECLARE productos_cursor CURSOR FOR SELECT ProductName, UnitPrice FROM products;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = 1;
  OPEN productos_cursor;
  bucle_productos: LOOP
    FETCH productos_cursor INTO producto_nombre, producto_precio;
    IF fin_cursor = 1 THEN
      LEAVE bucle_productos;
    END IF;
    SELECT CONCAT(producto_nombre, ' - ', producto_precio) AS 'Nombre y precio del producto';
  END LOOP;
  CLOSE productos_cursor;
END;

EXEC RecorrerTablaProductos

/*6 Crea un procedimiento almacenado que recorra los pedidos calcule el total de ventas de cada mes del año actual. El 
procedimiento debe devolver una tabla con dos columnas (mes y total)*/

CREATE PROCEDURE obtener_ventas_por_mes()
BEGIN
  DECLARE mes_actual INT;
  DECLARE total_ventas DECIMAL(10,2);
  DECLARE fin_cursor INT DEFAULT 0;
  DECLARE ventas_cursor CURSOR FOR SELECT MONTH(OrderDate), SUM(UnitPrice * Quantity) FROM orders JOIN order_details ON orders.OrderID = order_details.OrderID WHERE YEAR(OrderDate) = YEAR(CURDATE()) GROUP BY MONTH(OrderDate);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = 1;
  CREATE TABLE IF NOT EXISTS ventas_por_mes (mes INT, total DECIMAL(10,2));
  TRUNCATE TABLE ventas_por_mes;
  OPEN ventas_cursor;
  bucle_ventas: LOOP
    FETCH ventas_cursor INTO mes_actual, total_ventas;
    IF fin_cursor = 1 THEN
      LEAVE bucle_ventas;
    END IF;
    INSERT INTO ventas_por_mes (mes, total) VALUES (mes_actual, total_ventas);
  END LOOP;
  CLOSE ventas_cursor;
  SELECT * FROM ventas_por_mes;
END;

EXEC CalcularVentasPorMes

/*7 Crea un cursor que recorra la tabla de productos y actualice el precio de cada producto un 10%*/

DECLARE producto_id INT;
DECLARE producto_precio DECIMAL(10,2);
DECLARE fin_cursor INT DEFAULT 0;
DECLARE productos_cursor CURSOR FOR SELECT ProductID, UnitPrice FROM products;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = 1;
OPEN productos_cursor;
bucle_productos: LOOP
  FETCH productos_cursor INTO producto_id, producto_precio;
  IF fin_cursor = 1 THEN
    LEAVE bucle_productos;
  END IF;
  UPDATE products SET UnitPrice = producto_precio * 1.1 WHERE ProductID = producto_id;
END LOOP;
CLOSE productos_cursor;






