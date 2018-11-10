create or replace procedure consdato
(v_nombre IN VARCHAR2,
v_salxhora OUT NUMBER,
v_horatrab OUT NUMBER)
AS
BEGIN
select salarioxhora,horastrabajadas
into v_salxhora,v_horatrab
from trabajadores
where nombre=v_nombre;
END consdato;
/