#1
CALL actualizar_precio_productos();

#2
CALL insertar_persona('John Doe', 25);
SELECT * FROM personas;

#3
CALL mostrar_nombre_y_precio_productos();

#4
CALL obtener_nombre_cliente(id, @nombre);
SELECT @nombre;

-- Ejemplo de llamada al procedimiento obtener_nombre_cliente
SET @nombre = '';
CALL obtener_nombre_cliente(1, @nombre);
SELECT @nombre AS NombreCliente;

#5
CALL obtener_ventas_por_mes();
SELECT * FROM ventas_por_mes;

#6
SELECT obtener_precio_promedio_producto(id) AS precio_promedio;

#7
SELECT obtener_unidades_vendidas_producto(id) AS unidades_vendidas;



