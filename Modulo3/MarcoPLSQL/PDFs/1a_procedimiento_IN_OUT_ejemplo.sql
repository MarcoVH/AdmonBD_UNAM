create or replace procedure format_phone
(phone_no IN OUT VARCHAR2) IS
BEGIN
phone_no := '(' || SUBSTR(phone_no,1,3) ||
            ')' || SUBSTR(phone_no,4,3) ||
            '-' || SUBSTR(phone_no,7);
END format_phone;
/


DECLARE
 phone_no VARCHAR2(15):='8006330575';
BEGIN
dbms_output.put_line('Num telefonico antes de formato:' || phone_no);
format_phone(phone_no);
dbms_output.put_line('Num telefonico despues de formato:' || phone_no);
END;
/



 -- SQL PLUS --
VARIABLE phone_no VARCHAR2(15)
EXECUTE :phone_no := '8006330575'
PRINT   phone_no
EXECUTE format_phone (:phone_no)
PRINT phone_no
               