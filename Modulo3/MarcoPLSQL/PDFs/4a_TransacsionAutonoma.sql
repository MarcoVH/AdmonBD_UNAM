/** Utilizando el esquema STUDENT (tabla), ingrese el texto que a continuacion se muestra. **/
/* puede crear un bloque plsql y ejecutra el script */

BEGIN
INSERT INTO student
( student_id, Last_name, zip, registration_date,
created_by, created_date, modified_by,
modified_date
)
VALUES ( student_id_seq.nextval, 'Tashi', 10015,
'01-JAN-99', 'STUDENTA', '01-JAN-99',
'STUDENTA','01-JAN-99'
);
SAVEPOINT A;
INSERT INTO student
( student_id, Last_name, zip, registration_date,
created_by, created_date, modified_by,
modified_date
)
VALUES (student_id_seq.nextval, 'Sonam', 10015,
'01-JAN-99', 'STUDENTB','01-JAN-99',
'STUDENTB', '01-JAN-99'
);
SAVEPOINT B;
INSERT INTO student
( student_id, Last_name, zip, registration_date,
created_by, created_date, modified_by,
modified_date
)
VALUES (student_id_seq.nextval, 'Norbu', 10015,
'01-JAN-99', 'STUDENTB', '01-JAN-99',
'STUDENTB', '01-JAN-99'
);
SAVEPOINT C;
ROLLBACK TO B;
END;

// ********* Responda lo siguiente

a) Si se ejecuta el siguiente comando(no lo ejecute en este punto), que se esperaria que diera como salida y porque?
SELECT *
FROM student
WHERE last_name = 'Norbu';

b)Ahora ejecute el comando. Â¿que pasa y porque?
c) Ahora ejecuta el siguiente comando:
ROLLBACK to SAVEPOINT A;
Â¿que ocurre?
d) si ejecutara el siguiente comando(no lo ejecute en este punto), Â¿que esperaria ver?
SELECT last_name
FROM student
WHERE last_name = 'Tashi';
e)Ejecute el comando anterior y explique lo que encontro.

******************** //

DECLARE
v_Counter NUMBER;
BEGIN
v_counter := 0;
FOR i IN 1..100
LOOP
v_counter := v_counter + 1;
IF v_counter = 10
THEN
COMMIT;
v_counter := 0;
END IF;
END LOOP;
END;

/******
Â¿cuantas transacciones se tienen en el anterior bloque.

****** /

****************************************************************************



/****  Permiten salir del contexto de la transacciÃ³n y ejecutar una transaccion independiente
** y regresar a la transacciÃ³n llamada sin afectar el estado. No tiene un enlace con la
** transaccion de llamado, solamente los datos pueden ser compartidos por ambas transacciones
** Los siguientes elementos de plsql se pueden definir como transacciones autonomas  
** funciones y procedimientos
** procedimientos locacles y funciones definidas en un bloque de declaracion de un plsql
** funcion y procedimientos de un paquete
**  Metodos tipo
** bloques anonimos de alto nivel ************/

Ejemplo:


CREATE TABLE at_test (
  id           NUMBER       NOT NULL,
  description  VARCHAR2(50) NOT NULL
);

INSERT INTO at_test (id, description) VALUES (1, 'Description for 1');
INSERT INTO at_test (id, description) VALUES (2, 'Description for 2');

SELECT * FROM at_test;

        ID DESCRIPTION
---------- --------------------------------------------------
         1 Description for 1
         2 Description for 2

2 rows selected.

/*** Se insertan 8 filas empelando un bloque declarado como anonimo, el cual contiene la instruccion commit ***/

DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  FOR i IN 3 .. 10 LOOP
    INSERT INTO at_test (id, description)
    VALUES (i, 'Description for ' || i);
  END LOOP;
  COMMIT;
END;
/

PL/SQL procedure successfully completed.

SELECT * FROM at_test;

        ID DESCRIPTION
---------- --------------------------------------------------
         1 Description for 1
         2 Description for 2
         3 Description for 3
         4 Description for 4
         5 Description for 5
         6 Description for 6
         7 Description for 7
         8 Description for 8
         9 Description for 9
        10 Description for 10

10 rows selected.


/***  Como se esperaba se tiene en la tabla , ahora 10 registros. Si se ejecuta un rollback , se obtendria
** algo similar a lo siguiente **/

ROLLBACK;
SELECT * FROM at_test;

        ID DESCRIPTION
---------- --------------------------------------------------
         3 Description for 3
         4 Description for 4
         5 Description for 5
         6 Description for 6
         7 Description for 7
         8 Description for 8
         9 Description for 9
        10 Description for 10

8 rows selected.


/**** Las dos filas insertadas en la sesion actual (transaccion) han sido desechas, mientras los
** registros insertados con la transaccion autonoma permancecen. **/
** La presencia de la directiva de compilador PRAGMA AUTONOMOUS_TRANSACTION hace que el bloque anonimo
** se ejecute en su propia transaccion, por lo que el commit interno no afecta a la sesion (transaccion) inicial.
** por lo que el rollback solo afecta a la declaracion actual. **/

/** se emplean usualmente en rutinas de registro de errores, cuando un error debe ser preservado, a pesar
** de el estatus commit/rollback de una transaccion. **/

/** el siguiente ejemplo mantiene en una tabla el mensaje de error .


CREATE TABLE error_logs (
  id             NUMBER(10)     NOT NULL,
  log_timestamp  TIMESTAMP      NOT NULL,
  error_message  VARCHAR2(4000),
  CONSTRAINT error_logs_pk PRIMARY KEY (id)
);

CREATE SEQUENCE error_logs_seq;


/** se define el procedimiento que registrara los mensajes de error como una transaccion autonoma. **/

CREATE OR REPLACE PROCEDURE log_errors (p_error_message  IN  VARCHAR2) AS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  INSERT INTO error_logs (id, log_timestamp, error_message)
  VALUES (error_logs_seq.NEXTVAL, SYSTIMESTAMP, p_error_message);
  COMMIT;
END;
/

/** el siguiente codigo forza un error, el cual es atrapado y registrado **/

BEGIN
  INSERT INTO at_test (id, description)
  VALUES (998, 'Description for 998');

  -- Force invalid insert.
  INSERT INTO at_test (id, description)
  VALUES (999, NULL);
EXCEPTION
  WHEN OTHERS THEN
    log_errors (p_error_message => SQLERRM);
    ROLLBACK;
END;
/

PL/SQL procedure successfully completed.

SELECT * FROM at_test WHERE id >= 998;

no rows selected

SELECT * FROM error_logs;

        ID LOG_TIMESTAMP
---------- ---------------------------------------------------------------------------
ERROR_MESSAGE
----------------------------------------------------------------------------------------------------
         1 28-FEB-2006 11:10:10.107625
ORA-01400: cannot insert NULL into ("TIM_HALL"."AT_TEST"."DESCRIPTION"



/*** El uso indiscriminado de transacciones autonomas puede dar pie a candados mortales (deadlocks)
** causar confusion cuando se analiza un registro de sesion (trace). **/

/** Citando a Tom Kyte (Senior Technical Architect in Oracles Server Technology division at Oracle Corporation)
en 999 de 1000 casos, si se ve forzada a utilizar una transaccion autonoma, significa que se tienen una consideracion seria en la integridad de los datos.
*Â¿Donde se cree que se pueden utilizars?
* En disparadores que llaman a procedimientos que registra (commits) las declaraciones efectuadas. (no es una rutina de registro de error).
* En disparadores que estan teniendo la restriccion de una tabla mutante.
*Error loggin OK
*Otra situacion -- not ok








