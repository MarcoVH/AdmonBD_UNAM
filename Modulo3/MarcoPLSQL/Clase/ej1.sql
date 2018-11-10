set serveroutput on;

DECLARE
var_nombre VARCHAR2(35);
var_apellido VARCHAR2(35);
 BEGIN
SELECT fname, iname
INTO var_nombre, var_apellido
FROM staff
WHERE staffno = 'SL21';
DBMS_OUTPUT.PUT_LINE ('Nombre de chalán: '||var_nombre||' '||
var_apellido);
 EXCEPTION
WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE ('No existe un chalán con número '||
 ' SL21');
END;
/

DECLARE
var_nombre VARCHAR2(35);
var_apellido VARCHAR2(35);
 BEGIN
SELECT fname, iname
INTO var_nombre, var_apellido
FROM staff
WHERE staffno = 'SL50';
DBMS_OUTPUT.PUT_LINE ('Nombre de chalán: '||var_nombre||' '||
var_apellido);
 EXCEPTION
WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE ('No existe un chalán con número '||
 ' SL50');
END;
/

set serveroutput on size 5000;
declare
 exception varchar2(15);
Begin
 exception:='Esto es un ejercicio para no usar
 palabras reservadas';
 dbms_output.put_line(exception);
End;
/

DECLARE
-- Definir variable booleana
v_bool BOOLEAN;
BEGIN
-- La funcion NVL. Sustituye un valor cuando un valor nulo es encontrado
IF NOT NVL(v_bool,FALSE) THEN
dbms_output.put_line('Esto debe mostrarse');
ELSE
dbms_output.put_line('Esto no debe mostrarse');
END IF;
END;
/

DECLARE
x NUMBER := 0;
BEGIN
LOOP -- Depués de la declaración CONTINUE, el control continua aqui control
DBMS_OUTPUT.PUT_LINE ('Ciclo interno: x = ' || TO_CHAR(x));
x := x + 1;
--CONTINUE WHEN x < 3  -- Sentencia válida para oracle 11g
DBMS_OUTPUT.PUT_LINE
('Ciclo interno, despues de CONTINUE: x = ' || TO_CHAR(x));
EXIT WHEN x = 5;
END LOOP;
DBMS_OUTPUT.PUT_LINE ('Despues del Loop: x = ' || TO_CHAR(x));
END;
/

 declare
 v_test varchar2(8) := 'SIGUE';
 n_numb number := 2;
 begin
 while v_test <> 'PARA' loop
 if n_numb > 5
 then v_test := 'PARA';
 end if;
 dbms_output.put_line (v_test||': '||n_numb);
 n_numb := n_numb + 1;
 end loop;
 v_test := 'ABAJO';
 while n_numb > 1 AND v_test = 'ABAJO' loop
 dbms_output.put_line (v_test||': '||n_numb);
 n_numb := n_numb - 1;
 end loop;
 while 7 = 4 loop
 NULL; -- no entra aqui
 end loop;
 end;
 /

BEGIN
FOR i IN 1..10 LOOP
dbms_output.put_line('El valor del indice es ['||i||']');
END LOOP;
END;
/

BEGIN
CASE TRUE
WHEN (1 > 3) THEN
dbms_output.put_line('Uno es mayor que tres');
WHEN (3 < 5) THEN
dbms_output.put_line('Tres es menor que cinco');
WHEN (1 = 2) THEN
dbms_output.put_line('Uno es igual a dos');
ELSE
dbms_output.put_line('Nada es cierto.');
END CASE;
END;
/

DECLARE
vdescripcion VARCHAR2(50);
BEGIN
 SELECT desc_pais
 INTO vdescripcion
from PAIS
WHERE id_PAIS = '5';
dbms_output.put_line('La lectura del cursor es: '
|| vdescripcion);
end;
 /

DECLARE
CURSOR esclavos is
	select nom_emp, pat_emp, mat_emp
	from empleado;
 nombre varchar2(50);
 apat varchar2(50);
 amat varchar2(50);
 BEGIN
OPEN esclavos;
 FETCH esclavos INTO nombre, apat,amat;
 while esclavos%FOUND
 LOOP
 dbms_output.put_line(chr(13));
 dbms_output.put_line('la lectura del cursos es:'||nombre||'
'||apat||' '||amat);
 FETCH esclavos INTO nombre, apat,amat;
 dbms_output.put_line(esclavos%FOUND)
 END LOOP;
 CLOSE esclavos;
 END;
 /