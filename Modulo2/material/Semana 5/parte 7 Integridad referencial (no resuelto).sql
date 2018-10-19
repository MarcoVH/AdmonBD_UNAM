/*
La tabla de empleados necesita validar que el departamento exista en la tabla z_dept
la tabla de departamentos necesita de un gerente que debe de existir en la tabla empleados 
*/

drop table z_emp cascade constraints;
create table z_emp (eno number primary key,
			ename varchar2(20),
			mgr number,
			dno number);

drop table z_dept cascade constraints;
create table z_dept	(dno number primary key,
				mgr number constraint refer1 references z_emp(eno),
				dname varchar2(20));

alter table z_emp add constraint refer foreign key(dno) references z_dept(dno);


/*
Estas inserciones marcan error, porque los constraints por defecto son deferrable initially immediate
y se validan inmediatamente después de la sentencia DML
*/

insert into z_emp values(1000, 'Ángel', null, 1);
insert into z_dept values(1, 1000, 'Dirección General');


/*
La solución es declarar los constraints deferrable initially deferred, para que los constraints se validen al
finalizar la transacción, y no inmediantamente después de cada sentencia
*/

drop table z_emp cascade constraints;
create table z_emp (eno number primary key,
			ename varchar2(20),
			mgr number,
			dno number);

drop table z_dept cascade constraints;
create table z_dept	(dno number primary key,
				mgr number constraint refer1 references z_emp(eno) deferrable initially deferred,
				dname varchar2(20));

alter table z_emp add constraint refer foreign key(dno) references z_dept(dno) deferrable initially deferred;

insert into z_emp values(1000, 'Ángel', null, 1);
insert into z_dept values(1, 1000, 'Dirección General');

commit;


--Alteremos la tabla de empleados para que se valide que el jefe, a su vez, esté ya dado de alta como empleado

alter table z_emp add constraint emp_mgr_fk foreign key(mgr) references z_emp(eno);


--Insertemos ahora el organigrama de la Dirección General

--insert into z_emp values(1000, 'Ángel', null, 1);
insert into z_emp values(1001, 'Antonio', 1000, 1);
insert into z_emp values(1002, 'Eva', 1000, 1);
insert into z_emp values(1003, 'Carmen', 1002, 1);
insert into z_emp values(1004, 'Andrés', 1002, 1);
insert into z_emp values(1005, 'Carmelo', 1004, 1);


--Observemos el resultado de las siguientes consultas:

SELECT level, ename
FROM z_emp
START WITH ename=&en
CONNECT BY PRIOR eno=mgr;

SELECT level, ename
FROM z_emp
START WITH ename=&en
CONNECT BY eno= PRIOR mgr;


/*
Consulta que muestre sólo los primeros 5 registros de la tabla empleados; en realidad, este filtrado se usa para
tablas enormes
*/

select rownum, rowid, e.*
from z_emp e
where rownum<5;


