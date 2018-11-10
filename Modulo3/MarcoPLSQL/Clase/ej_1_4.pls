DECLARE
CURSOR c_ejercicio IS
SELECT nombrearticulo FROM articulo;
BEGIN
FOR i IN c_ejercicio LOOP
dbms_output.put_line(‘El titulo es ['||
i.nombrearticulo||']');
END LOOP;
END;
/