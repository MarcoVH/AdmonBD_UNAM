#1
select initcap(nom_emp) || ' ' || 
initcap(pat_emp) || ' ' || 
initcap(mat_emp) || ' tiene ' ||
trunc(months_between(sysdate, fecha_nac_emp)/12) as "exp"
from udiplo.empleado
where mat_emp like '___E%'
and to_number(to_char(fecha_nac_emp, 'fmDD'))>=25
order by fecha_nac_emp, pat_emp desc, mat_emp desc, nom_emp desc;

#2
select id_factura, fecha_factura, id_cliente, monto_factura,
lpad(to_char(iva_factura,'FM$99,999.00'),10,' ') as iva,
lpad(to_char(total_factura,'FM$99,999.00'),10,' ') as total
from udiplo.factura
where id_cliente in (1,2);

#3
select id_factura, last_day(fecha_factura) as pago,
last_day(fecha_factura)+15 as gracia,
next_day(last_day(fecha_factura)+15,1)
from udiplo.factura;

#4
select lower(substr(nom_emp,1,1))||upper(substr(nom_emp,2)) || ' ' ||
lower(substr(pat_emp,1,1))||upper(substr(pat_emp,2)) || ' ' ||
lower(substr(mat_emp,1,1))||upper(substr(mat_emp,2)) || ' nació el día ' || 
lower(to_char(fecha_nac_emp, 'fmDD " de " fmMONTH " de " fmYYYY'))
as exp
from empleado
where fecha_nac_emp between to_date('01/01/1979') and to_date('01/01/2000');

#5
select nom_emp
from udiplo.empleado
where upper(nom_emp) like 'MARIA%'
order by pat_emp;

#6
select substr(nom_emp,1,length(nom_emp)-instr(nom_emp,' ')) as nom_pil,
initcap(to_char(fecha_nac_emp, 'fmDAY')) as dia
from udiplo.empleado;

#7
select id_cliente, replace(razon_social_cliente,'CLI','DEM')
from cat_cliente
where length(id_cliente)<3;

#8
SELECT lpad(id_emp,7,'0')||
rpad(pat_emp,20,' ')||
rpad(mat_emp,20,' ')||
rpad(nom_emp,30,' ')||
to_char(fecha_nac_emp,'MM-DD-YYYY')||
nvl(to_char(edad_emp,'fm00'),'00')||
nvl(rfc_emp,'**********')
as "CADENA"
FROM empleado;

spool 'M:\DiplomadoBD\Modulo2\Pregunta8.txt'
/
spool off
