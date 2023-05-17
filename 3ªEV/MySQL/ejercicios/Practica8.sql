SET @CadSalida="";
CALL EJ1BIS("mis alumnos son muy participativos", @cadSalida);
SELECT @CadSalida;