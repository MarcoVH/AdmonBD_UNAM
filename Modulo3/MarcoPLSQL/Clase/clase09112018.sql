DECLARE
TYPE integer_varray IS VARRAY(3) OF INTEGER;
varray_integer INTEGER_VARRAY := integer_varray(NULL,NULL,NULL);
BEGIN
dbms_output.put (CHR(10));
dbms_output.put_line('Varray inicializado con NULLS.');
dbms_output.put_line('--------------------------------');
FOR i IN 1..3 LOOP
dbms_output.put ('Varray de enteros ['||i||'] ');
dbms_output.put_line('['||varray_integer(i)||']');
END LOOP;
