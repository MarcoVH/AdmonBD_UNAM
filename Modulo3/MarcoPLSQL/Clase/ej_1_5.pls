set serveroutput on;
DECLARE
CURSOR c_equipo IS
SELECT DESC_EQUIPO FROM EQUIPO;
BEGIN
FOR i IN c_equipo LOOP
dbms_output.put_line('El equipo es ['||
i.DESC_EQUIPO||']');
END LOOP;
END;
/