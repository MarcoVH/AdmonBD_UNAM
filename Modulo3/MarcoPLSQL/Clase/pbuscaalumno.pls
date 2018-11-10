create or replace procedure pbuscaalumno
(v_nocta IN NUMBER,
v_nombre OUT varchar2,
v_ape OUT varchar2)
AS
BEGIN
select nombre, apellidos
into v_nombre,v_ape
from estudiantes
where nocta=v_nocta;
END pbuscaalumno;
/