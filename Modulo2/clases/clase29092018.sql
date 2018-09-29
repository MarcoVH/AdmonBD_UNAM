
SELECT e.employee_id, e.last_name, d.department_name, d.department_id
from employees e, departments d
WHERE e.department_id=d.department_id
Order by 2;

SELECT e.last_name,e.hire_date,j.job_title
FROM employees e, jobs j
WHERE e.job_id=j.job_id
ORDER by 2;

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND e.last_name='King';

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id is NULL;

SELECT e.employee_id, e.salary, e.last_name,d.department_id,d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND (e.department_id=110
OR e.salary>15000);

#udiplo
select 'Tiene ' || (to_char(sysdate,'yyyy')-to_char(fecha_nac_emp,'yyyy')) || ' ' || 'años'
from empleado;

select e.last_name, e.salary, d.department_id, l.city 
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and d.department_name = 'Accounting'
order by 1;

select e.last_name, e.salary, j.grade_id
from employees e, job_grades j
where e.salary between j.lowest_sal and j.highest_sal;

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where 	e.department_id = d.department_id (+);

select worker.last_name || ' works for ' || nvl(manager.last_name, 'Money') as direct_reports
from employees worker, employees manager
where worker.manager_id  = manager.employee_id (+);

select department_id, department_name, location_id, city
from departments
natural join locations
where department_id in (20,50);

select e.employee_id, e.last_name, d.location_id
from employees e join departments d
using (department_id)
where department_id=100;

select employee_id, city, department_name
from employees e join departments d 
on d.department_id = e.department_id
join locations l 
on d.location_id = l.location_id;

select department_id, job_id, employee_id
from employees
union
select department_id, job_id, employee_id
from job_history
order by employee_id

select employee_id, job_id
from job_history
intersect 
select employee_id, job_id
from employees;

select employee_id, job_id, department_id
from employees
union
select employee_id, job_id, department_id
from job_history;

select employee_id, department_id
from job_history
where department_id in (20,90)
minus
select employee_id, department_id
from employees
where salary > 5000;

select avg(salary) from employees;
select sum (salary)*12 from employees;
select avg(commission_pct) from employees;
select avg(nvl(commission_pct, 0)) from employees;

select min(salary), max(salary), min(hire_date), max(hire_date), 
min(last_name), max(last_name)
from employees;

select count(last_name) from employees;

select count(last_name), department_id
from employees group by department_id;

select max(count(last_name))
from employees group by department_id

select count(department_id), count(distinct(department_id))
from employees;

select department_id, avg(salary) as promedio
from employees
group by department_id
order by promedio;

select avg(commission_pct), min(hire_date), max(salary*12), department_id
from employees
where job_id <> 'ST CLERK'
group by department_id;

select department_id, avg(salary), max(salary)
from employees
group by department_id
having max(salary)>10000;

select job_id, sum(salary) payroll
from employees
where manager_id is not null
group by job_id
having sum(salary) > 15000
order by payroll;
