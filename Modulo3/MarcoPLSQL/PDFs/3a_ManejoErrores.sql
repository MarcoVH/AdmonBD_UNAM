/* SQLCODE y SQLERRM*/
/* Ingrese el valor  07548 */
/* En este ejemplo se muestra un mensaje de que  */
/* ocurriÃ³ un error en tiempo de ejecuciÃ³n, pero */
/* no se sabe que error es y que fue lo que causÃ³ */


DECLARE
v_zip VARCHAR2(5) := '&sv_zip';
v_city VARCHAR2(15);
v_state CHAR(2);
BEGIN
SELECT city, state
INTO v_city, v_state
FROM zipcode
WHERE zip = v_zip;
DBMS_OUTPUT.PUT_LINE (v_city||', '||v_state);
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('Un error ocurrio');
END;
/

/*
PodrÃ­a no existir el cÃ³digo ingresado en la
tabla de ZIPCODE, o quizÃ¡s el tipo de datos 
podrÃ­a no coincidir en el SELECT INTO. Existen
otras posibilidades que pueden dar pie a un
error en tiempo de ejecuciÃ³n. Es BUENA PRACTICA.
hacer uso de el manejo de excepciones OTHERS (atrapa el error que no haya sido
atrapado antes por otra excepciÃ³n)
Oracle nos facilita dos funciones, empleadas con
OTHERS,
SQLCODE = nos regresa el nÃºmero de error de oracle
SQLERRM = nos regresa el mensaje del error

*/

DECLARE
v_zip VARCHAR2(5) := '&sv_zip';
v_city VARCHAR2(15);
v_state CHAR(2);
v_err_code NUMBER;
v_err_msg VARCHAR2(200);
BEGIN
SELECT city, state
INTO v_city, v_state
FROM zipcode
WHERE zip = v_zip;
DBMS_OUTPUT.PUT_LINE (v_city||', '||v_state);
EXCEPTION
WHEN OTHERS THEN
v_err_code := SQLCODE;
v_err_msg := SUBSTR(SQLERRM, 1, 200);
DBMS_OUTPUT.PUT_LINE ('Codigo de Error: '||v_err_code);
DBMS_OUTPUT.PUT_LINE ('Mensaje de Error: '||v_err_msg);
END;

/* Ejercicio : 
Escribir un bloque pl/sql que:
seleccione el nombre de un empleado con
un valor de salario dado.
Emplear el comando DEFINE para proporcionar
el salario. Pasar el valor al bloque ,
a travÃ©s de sustituciÃ³n de variable.

Si el salario ingresado regresa mÃ¡s de una fila, manejar la excepciÃ³n
con un manejador de exepciÃ³n apropiado e insertarlo en una tabla
MENSAJES, ingresando el mensaje "MÃ¡s de un empleado con un salario de <salario>"
Si no regresa ninguna fila, manejar la exepciÃ³n e insertar el mensaje
"No existen empleados con un salario de <salario>"
Si el salario ingresado regresa una fila, insertar un mensaje en la tabla
MENSAJES, con el nombre del empleado y la cantidad de salario.

Manejar cualquier otra excepciÃ³n, con un un manejo de exepciones apropiado,
e insertar el mensaje "Algun otro error ocurrio"

Cambie el mensaje si ocurre alguna otra excepciÃ³n, por el codigo y el mensaje
de error e ingreselo en la tabla MENSAJES.
*/