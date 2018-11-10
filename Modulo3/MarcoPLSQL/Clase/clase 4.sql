#Ejemplo 1 Arreglo asociativo

DECLARE
CURSOR c_nombre IS
SELECT last_name
FROM student
WHERE rownum <= 10;
TYPE tipo_apellido IS TABLE OF student.last_name%TYPE
INDEX BY BINARY_INTEGER; --cualquier tipo de datos PL/SQL con algunas restricciones --
tabla_apellido tipo_apellido;
v_contador INTEGER := 0;
BEGIN
FOR reg_nombre IN c_nombre LOOP
v_contador := v_contador + 1;
tabla_apellido(v_contador) := reg_nombre.last_name;
DBMS_OUTPUT.PUT_LINE ('apellido('||v_contador||'): '||
tabla_apellido(v_contador));
END LOOP;
END;
/

#Ejemplo 2. Arreglo asociativo

SET SERVEROUTPUT ON
DECLARE
TYPE poblacion IS TABLE OF NUMBER
INDEX BY VARCHAR2(64);
poblacion_ciudad poblacion;
i VARCHAR2(64);
BEGIN
poblacion_ciudad('Durango') := 2000;
poblacion_ciudad('Acapulco') := 750000;
poblacion_ciudad('DF') := 1000000;
poblacion_ciudad('Tlaxcala') := 2001;
i := poblacion_ciudad.FIRST;
WHILE i IS NOT NULL LOOP
DBMS_Output.PUT_LINE ('Poblacion de ' || i || ' es de ' || TO_CHAR(poblacion_ciudad(i)));
i := poblacion_ciudad.NEXT(i);
END LOOP;
END;
/

#Ejemplo de tabla anidada

set serveroutput on
DECLARE
CURSOR c_nombre IS
SELECT last_name
FROM student
WHERE rownum <= 10;
TYPE tipo_apellido IS TABLE OF student.last_name%TYPE;
tabla_apellido tipo_apellido:= tipo_apellido(); --
v_contador INTEGER := 0;
BEGIN
FOR reg_nombre IN c_nombre LOOP
v_contador := v_contador + 1;
tabla_apellido.EXTEND;
tabla_apellido(v_contador) := reg_nombre.last_name;
DBMS_OUTPUT.PUT_LINE ('Apellido('||v_contador||'): '||
tabla_apellido(v_contador));
END LOOP;
END;
/


DECLARE
TYPE indice_por_tipo IS TABLE OF NUMBER
INDEX BY BINARY_INTEGER;
indice_por_tabla indice_por_tipo;
TYPE tipo_anidado IS TABLE OF NUMBER;
tabla_anidada tipo_anidado := tipo_anidado(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
BEGIN
FOR i IN 1..10 LOOP
indice_por_tabla(i) := i;
END LOOP;
IF indice_por_tabla.EXISTS(3) THEN
DBMS_OUTPUT.PUT_LINE ('indice_por_tabla(3) = '||indice_por_tabla(3));
END IF;
tabla_anidada.DELETE(10);
tabla_anidada.DELETE(1,3);
indice_por_tabla.DELETE(10);
DBMS_OUTPUT.PUT_LINE ('tabla_anidada.COUNT = '||tabla_anidada.COUNT);
DBMS_OUTPUT.PUT_LINE ('indice_por_tabla.COUNT = '|| indice_por_tabla.COUNT);
DBMS_OUTPUT.PUT_LINE ('tabla_anidada.FIRST = '||tabla_anidada.FIRST);
DBMS_OUTPUT.PUT_LINE ('tabla_anidada.LAST = '||tabla_anidada.LAST);
DBMS_OUTPUT.PUT_LINE ('indice_por_tabla.FIRST = '||indice_por_tabla.FIRST);
DBMS_OUTPUT.PUT_LINE ('indice_por_tabla.LAST = '|| indice_por_tabla.LAST);
DBMS_OUTPUT.PUT_LINE ('tabla_anidada.PRIOR(2) = '|| tabla_anidada. PRIOR(2));
DBMS_OUTPUT.PUT_LINE ('tabla_anidada.NEXT(2) = '|| tabla_anidada.NEXT(2));
DBMS_OUTPUT.PUT_LINE ('indice_por_tabla.PRIOR(2) = '|| indice_por_tabla.PRIOR(2));
DBMS_OUTPUT.PUT_LINE ('indice_por_tabla.NEXT(2) = '|| indice_por_tabla.NEXT(2));
tabla_anidada.TRIM(2);
tabla_anidada.TRIM;
DBMS_OUTPUT.PUT_LINE('tabla_anidada.LAST = '||tabla_anidada.LAST);
END;
/

