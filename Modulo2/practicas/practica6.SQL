drop table exceptions;
CREATE TABLE EXCEPTIONS (ROW_ID ROWID,
OWNER VARCHAR2(30), TABLE_NAME VARCHAR2(30), CONSTRAINT VARCHAR2(30));


DROP TABLE EMP cascade constraints;
create table emp(
id_empleado number(5) primary key,
curp_empleado varchar2(18) unique, 
rf_empleado varchar2(10),
paterno_empleado varchar2(40) not null,
nombre_empleado varchar2(40),
edad_empleado number(2) check (edad_empleado>18),
id_jefe_empleado number(5),
foreign key (id_jefe_empleado) references emp(id_empleado) deferrable initially deferred
);


insert into emp values(1,'VAHM860503KDI','VAHM860503','VAZQUEZ','MARCO',32,2);
INSERT into emp values(2,'GGJC860503KDI','GGJC860503','GONZALEZ','JUAN',24,1);
commit;


#CHECAR CONSTRAINTS
select c.constraint_name, c.constraint_type, cc.column_name
from user_constraints c , user_cons_columns cc
where c.owner = 'UDIPLO'
and c.table_name='EMP'
AND c.owner=cc.owner
and c.constraint_name=cc.constraint_name
order by c.constraint_name, cc.position;

#CHECAR INDICES
select index_name, index_type, table_name, uniqueness
from user_indexes
where table_owner='UDIPLO'
and table_name in ('EMP');

ALTER TABLE emp disable constraint SYS_C004152 CASCADE;

insert into emp values(3,'VAHM860503KDI','VAHM860503','VAZQUEZ','MARCO',32,2);
commit;
#3

ALTER TABLE emp drop constraint SYS_C004153;

update emp set id_jefe_empleado=5 where id_empleado=3;

#alter table emp add constraint emp_fk foreign key (id_jefe_empleado)
# references emp(id_empleado)
#deferrable initially deferred;

alter table emp add constraint emp_fk 
foreign key (id_jefe_empleado) references emp(id_empleado) 
exceptions into exceptions;

select * from exceptions;

alter table emp add constraint emp_fk 
foreign key (id_jefe_empleado) references emp(id_empleado)
enable novalidate ; 

insert into emp values(4,'VAHM860503KDI','VAHM860503','VAZQUEZ','MARCO',32,7);
commit;

##### trash

