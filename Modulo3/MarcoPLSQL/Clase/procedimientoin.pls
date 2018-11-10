create or replace procedure insdato
(v_nombre IN trabajadores.nombre%TYPE, v_salxhora IN
trabajadores.salarioxhora%TYPE, v_horatrab IN
trabajadores.horastrabajadas%TYPE)
IS
BEGIN
INSERT INTO trabajadores (nombre,salarioxhora,horastrabajadas)
values (v_nombre,v_salxhora,v_horatrab);
commit work;
end insdato;
/