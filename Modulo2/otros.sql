
#Login
connect system
psw: diplo
connect udiplo 
psw: acatlan
connect aux1
psw: auxiliar

#Ver las tablas que existen
SELECT * FROM tab;

# Borrar tablas basura
PURGE TABLESPACE diplo;

# Estructura de tabla
DESC tabla


*******Clase Viernes 28 de Septiembre de 2018************
connect hr
psw: diplo

SELECT employee_id,first_name,last_name 
FROM employees
order by 3,2;

SELECT employee_id,first_name,last_name 
FROM employees
order by 3,2;

spool 'M:\DiplomadoBD\Modulo2\salida.txt'
/
spool off

SELECT distinct last_name, first_name
from employees
order by 1;
