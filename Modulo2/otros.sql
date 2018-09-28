
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

connect hr
psw: diplo

SELECT employee_id,first_name,last_name 
FROM employees
order by 3,2;

