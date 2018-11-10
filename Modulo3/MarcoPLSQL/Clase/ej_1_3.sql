set serveroutput on;
DECLARE
nombre VARCHAR2(30);
BEGIN
nombre := '&entrada';
dbms_output.put_line('Hola '|| nombre );
END;
/