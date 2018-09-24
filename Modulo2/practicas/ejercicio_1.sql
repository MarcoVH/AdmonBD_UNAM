#1 
select department_id, last_name, 
to_char(salary,'$99,999'), 
to_char(salary*(1+.1),'$99,999') "salario nuevo"
from hr.employees
where department_id=90 and
last_name like 'L%'
order by last_name;

#2 
select department_id, last_name, 
to_char(salary,'$99,999') "salario", 
to_char(salary*(1-.1),'$99,999') "salario_nuevo"
from hr.employees
where department_id in (100,103) and
last_name like 'K%'
or last_name like 'D%'
or last_name like 'P%'
order by salary*(1-.10);

#3
select initcap(nom_emp) || ' ' || 
initcap(pat_emp) || ' ' || 
initcap(mat_emp) || ' nació el ' ||
to_char(fecha_nac_emp, 'fmDD " de " Month " de " YYYY' ) as "exp"
from udiplo.empleado
where mod(id_emp,2)=1;

#4
select * 
from udiplo.pais
where desc_pais like '%ar%';

#5
select * 
from udiplo.equipo
where desc_equipo like '___m%';

#6
select nom_emp, pat_emp, mat_emp
from udiplo.empleado
where fecha_nac_emp > '15/03/1975';

#7
select first_name, last_name
from hr.employees 
where manager_id is null;

#8 ##
select department_id, first_name, last_name,
 NVL(to_char(manager_id), 'Sin Jefe')
from hr.employees
where department_id in (60,90)
order by department_id desc;

#9 #
select department_id, first_name, last_name
from hr.employees
where department_id not in (60,90,110)
order by 2,3;

#10 
select first_name, last_name, salary
from hr.employees
where salary between 10000 and 20000;

#11 ##
select sysdate AS "Hoy", to_char(next_day(sysdate,3), 
'Day DD " de " Month " de " YYYY') AS "Prox. Miércoles"
from dual;