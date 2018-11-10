set serveroutput on;
DECLARE
d DATE := SYSTIMESTAMP;
t TIMESTAMP(4) := SYSTIMESTAMP;
BEGIN
dbms_output.put_line('DATE ['||d||']');
dbms_output.put_line('TO_CHAR ['||
TO_CHAR(d,'DD-MON-YY HH24:MI:SS')||']');
dbms_output.put_line('TIMESTAMP ['||t||']');
END;
/