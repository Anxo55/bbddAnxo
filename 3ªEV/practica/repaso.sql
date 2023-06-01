/*1 Crea un procedimiento almacenado que reciba dos parametros de entrada(nombre y edad) y los inserte en una tabla llamada personas
que tiene tres columnas (id, nombre, edad). El id es un valor autoincremental DA LA TABLA PERSONAS YA CREADA EN EL EXAMEN*/

CREATE PROCEDURE InsertarPersona
  @nombre VARCHAR(50),
  @edad INT
AS
BEGIN
  INSERT INTO personas (nombre, edad)
  VALUES (@nombre, @edad)
END

CREATE TABLE personas
(
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50),
  edad INT
)

/*2 Crea un procedimiento almacenado que reciba un parametro de entrada(id) y devuelva el nombre de la persona correspondiente de 
la tabla clientes*/

CREATE PROCEDURE ObtenerNombreCliente
  @id INT,
  @nombreCliente VARCHAR(50) OUTPUT
AS
BEGIN
  SELECT @nombreCliente = nombre
  FROM clientes
  WHERE id = @id
END

DECLARE @nombreCliente VARCHAR(50)
EXEC ObtenerNombreCliente @id = 1, @nombreCliente = @nombreCliente OUTPUT
SELECT @nombreCliente

/*3 Crea una funcion que reciba un parametro de entrada que es el id del producto y devuelva el numero de unidades vendidas
de ese producto*/

CREATE FUNCTION ObtenerUnidadesVendidas
(
  @idProducto INT
)
RETURNS INT
AS
BEGIN
  DECLARE @unidadesVendidas INT

  SELECT @unidadesVendidas = SUM(d.Quantity)
  FROM OrderDetails d
  INNER JOIN Orders o ON d.OrderID = o.OrderID
  WHERE d.ProductID = @idProducto
    AND o.OrderDate IS NOT NULL

  RETURN @unidadesVendidas
END

DECLARE @idProducto INT
SET @idProducto = 1 -- ID del producto que deseas consultar

SELECT dbo.ObtenerUnidadesVendidas(@idProducto) AS UnidadesVendidas

/*4 Crea una funcion que reciba un parametro de entrada (id del producto) y devuelva el precio promedio de ese producto en
todos los pedidos*/

CREATE FUNCTION dbo.ObtenerPrecioPromedio
(
  @idProducto INT
)
RETURNS MONEY
AS
BEGIN
  DECLARE @precioPromedio MONEY

  SELECT @precioPromedio = AVG(od.UnitPrice)
  FROM [Order Details] od
  INNER JOIN Orders o ON od.OrderID = o.OrderID
  WHERE od.ProductID = @idProducto

  RETURN @precioPromedio
END

DECLARE @idProducto INT
SET @idProducto = 1 -- ID del producto que deseas consultar

SELECT dbo.ObtenerPrecioPromedio(@idProducto) AS PrecioPromedio

/*5 Crea un procedimiento almacenado con un cursor que recorra la tabla de productos y muestre por pantalla el nombre y el 
precio de cada producto*/

CREATE PROCEDURE RecorrerTablaProductos
AS
BEGIN
  DECLARE @nombreProducto NVARCHAR(50)
  DECLARE @precio MONEY

  DECLARE cursorProductos CURSOR FOR
  SELECT ProductName, UnitPrice
  FROM Products

  OPEN cursorProductos

  FETCH NEXT FROM cursorProductos INTO @nombreProducto, @precio
  WHILE @@FETCH_STATUS = 0
  BEGIN
    PRINT 'Nombre del producto: ' + @nombreProducto
    PRINT 'Precio del producto: ' + CONVERT(NVARCHAR(20), @precio)

    FETCH NEXT FROM cursorProductos INTO @nombreProducto, @precio
  END

  CLOSE cursorProductos
  DEALLOCATE cursorProductos
END

EXEC RecorrerTablaProductos

/*6 Crea un procedimiento almacenado que recorra los pedidos calcule el total de ventas de cada mes del año actual. El 
procedimiento debe devolver una tabla con dos columnas (mes y total)*/

CREATE PROCEDURE CalcularVentasPorMes
AS
BEGIN
  DECLARE @FechaInicio DATETIME
  DECLARE @FechaFin DATETIME

  SET @FechaInicio = DATEFROMPARTS(YEAR(GETDATE()), 1, 1)
  SET @FechaFin = DATEFROMPARTS(YEAR(GETDATE()), 12, 31)

  SELECT MONTH(OrderDate) AS Mes, SUM(TotalAmount) AS Total
  FROM Orders
  WHERE OrderDate >= @FechaInicio AND OrderDate <= @FechaFin
  GROUP BY MONTH(OrderDate)
END

EXEC CalcularVentasPorMes

/*7 Crea un cursor que recorra la tabla de productos y actualice el precio de cada producto un 10%*/

DECLARE @productoID INT
DECLARE @nuevoPrecio MONEY

DECLARE cursorProductos CURSOR FOR
SELECT ProductID, UnitPrice
FROM Products

OPEN cursorProductos

FETCH NEXT FROM cursorProductos INTO @productoID, @nuevoPrecio
WHILE @@FETCH_STATUS = 0
BEGIN
  SET @nuevoPrecio = @nuevoPrecio * 1.1 -- Aumenta el precio en un 10%

  UPDATE Products
  SET UnitPrice = @nuevoPrecio
  WHERE ProductID = @productoID

  FETCH NEXT FROM cursorProductos INTO @productoID, @nuevoPrecio
END

CLOSE cursorProductos
DEALLOCATE cursorProductos






