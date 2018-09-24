connect hr
diplo

set pagesize 200
set linesize 500

select employee_id "clave", first_name ||' '|| last_name as "empleado",
' es empleado de ' , manager_id, 
salary*12 "sueldo anual",
commission_pct,
salary*12*(1+commission_pct) "sueldo con comisión"
from employees
where commission_pct is not null
and manager_id = 100;

select employee_id, hire_date, department_id
from employees
where hire_date between '01/01/1990' and '31/12/1995'
and department_id in (30,100,110);

select employee_id, hire_date, department_id, last_name
from employees
where last_name like '%te%';

select employee_id, hire_date, department_id, last_name
from employees
where last_name like '_e%';

select first_name, last_name, email
from employees
where lower(substr(first_name, 1,1) || last_name) = lower(email);

select lower(email), upper(last_name), initcap(email)
from employees;

select first_name, last_name, substr(first_name,3,2), 
substr(first_name, -4,2), length(last_name)
from employees
order by 1 desc , 2 desc;

select last_name, instr(last_name, 'a',1,2) "a", 
instr(last_name,'a',-1,2) "a2",
instr(last_name,'a', 3,2) "a3",
instr(upper(last_name), 'A') "A"
from employees
order by 1;

select first_name
from employees
where instr(first_name, ' ') !=0;

select last_name, lpad(last_name, 20, '*'), rpad(last_name,30,'?')
from employees order by 1;

select length(trim('     prueba   ')) "trim", 
from employees;

select hire_date, sysdate, months_between(hire_date, sysdate),
next_day(sysdate,3), last_day(sysdate)
from employees;


#ROUND('25-JUL-01', 'MONTH') = '01-AUG-01',
#ROUND('25-JUL-99', 'YEAR') = '01-JAN-00',
#TRUNC('25-JUL-00', 'MONTH') = '01-JUL-00',
#TRUNC('25-JUL-01', 'YEAR') = '01-JAN-01'

select
ROUND(to_date('25/06/2001'), 'MONTH')
from dual;

select 'Hoy es ' || 
initcap(to_char(sysdate, 'fmDAY', 'nls_date_language=SPANISH')) || ' ' ||
initcap(to_char(sysdate, 'fmDD', 'nls_date_language=SPANISH')) || ' de ' ||
initcap(to_char(sysdate, 'fmMONTH', 'nls_date_language=SPANISH')) || ' de ' ||
initcap(to_char(sysdate, 'fmYYYY', 'nls_date_language=SPANISH')) as "fecha"
from dual;

select to_char(hire_date, 'DD/MON/YYYY', 'nls_date_language=AMERICAN')
from employees;


select first_name, job_id, salary, 
case job_id when 'IT_PROG' then 1.1*salary
when 'ST_CLERK' then 1.15*salary
when 'SA_REP' then 1.2*salary
else salary end revised_salary
from employees;