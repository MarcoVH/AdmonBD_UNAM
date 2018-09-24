1.2.
CREATE USER aux1 IDENTIFIED BY dd DEFAULT TABLESPACE diplo;
CONNECT SYSTEM
grant connect to aux1;

GRANT SELECT ON udiplo.factura TO aux1;
GRANT SELECT ON udiplo.pago TO aux1;
GRANT SELECT ON udiplo.empleado TO aux1;


**para saber la fecha del sistema, coloco
select sysdate from dual;
'dd/mm/aa'**

3.

savepoint A;
#drop sequence pais_seq;
#drop sequence lugar_seq;
#drop sequence equipo_seq;

#create sequence pais_seq;
#create sequence lugar_seq;
#create sequence equipo_seq;


insert into pais values (pais_seq.NEXTVAL,'Uruguay');
insert into pais values (pais_seq.NEXTVAL,'Brasil');
insert into pais values (pais_seq.NEXTVAL,'Argentina');
insert into pais values (pais_seq.NEXTVAL,'Paraguay');


insert into lugar values (lugar_seq.NEXTVAL,'Primer lugar');
insert into lugar values (lugar_seq.NEXTVAL,'Segundo lugar');


insert into equipo values (equipo_seq.NEXTVAL,'Peñarol','1');
insert into equipo values (equipo_seq.NEXTVAL,'Santos','2');
insert into equipo values (equipo_seq.NEXTVAL,'Independiente','3');
insert into equipo values (equipo_seq.NEXTVAL,'Racing Club','3');
insert into equipo values (equipo_seq.NEXTVAL,'Estudiantes','3');
insert into equipo values (equipo_seq.NEXTVAL,'Olimpia','4');
insert into equipo values (equipo_seq.NEXTVAL,'Palmeiras','2');
insert into equipo values (equipo_seq.NEXTVAL,'Boca jr','3');
insert into equipo values (equipo_seq.NEXTVAL,'Nacional','1');
insert into equipo values (equipo_seq.NEXTVAL,'River Plate','3');


insert into torneo values (1960,1,1,2);
insert into torneo values (1961,1,1,2);
insert into torneo values (1962,2,1,3);
insert into torneo values (1963,2,1,5);
insert into torneo values (1964,3,1,1);
insert into torneo values (1965,3,1,4);
insert into torneo values (1966,1,1,4);
insert into torneo values (1967,4,1,2);
insert into torneo values (1968,5,1,2);
insert into torneo values (1969,5,1,3);
insert into torneo values (1970,5,1,1);
insert into torneo values (1960,6,2,1);
insert into torneo values (1961,7,2,1);
insert into torneo values (1962,1,2,0);
insert into torneo values (1963,8,2,3);
insert into torneo values (1964,9,2,0);
insert into torneo values (1965,1,2,1);
insert into torneo values (1966,10,2,2);
insert into torneo values (1967,9,2,1);
insert into torneo values (1968,7,2,0);
insert into torneo values (1969,9,2,0);
insert into torneo values (1970,1,2,0);

insert into factura values ('1','04/10/2006','2','300','45','345');
insert into factura values ('2','13/10/2006','1','1000','150','1150');
insert into factura values ('3','20/10/2006','1','3000','450','3450');
insert into factura values ('4','25/10/2006','3','600','90','690');

insert into cat_division values ('1','NORTE');
insert into cat_division values ('2','SUR');
insert into cat_division values ('3','ESTE');
insert into cat_division values ('4','OESTE');

insert into cat_cliente values('1','CLIENTE1','1','15');
insert into cat_cliente values('2','CLIENTE2','1','30');
insert into cat_cliente values('3','CLIENTE3','2','15');


INSERT INTO pago VALUES(1,'01/11/2006',3,60);


INSERT INTO empleado(id_emp, pat_emp, mat_emp, nom_emp, fecha_nac_emp)
 VALUES(1001, 'ARELLANO', 'MORENO','JOSE','10/10/1980');
 INSERT INTO empleado(id_emp, pat_emp, mat_emp, nom_emp, fecha_nac_emp)
 VALUES(1002, 'VARGAS','GOMEZ','ALMA DELIA', '22/01/1975');
 INSERT INTO empleado(id_emp, pat_emp, mat_emp, nom_emp, fecha_nac_emp)
 VALUES(1003, 'DE LA TORRE','ROSAS','XOCHITL', '29/01/1990'); 

savepoint B;

5.(corrimos savepoint A para el punto 9)
update factura set fecha_factura ='04/10/2011'
where fecha_factura = '04/10/2006';

update factura set fecha_factura ='13/10/2011'
where fecha_factura = '13/10/2006';

update factura set fecha_factura ='20/10/2011'
where fecha_factura = '20/10/2006';

update factura set fecha_factura ='25/10/2011'
where fecha_factura = '25/10/2006';

update pago set fecha_pago = '01/11/2011' where fecha_pago='01/11/2006';


6.
update factura set id_cliente = 3 where monto_factura > 300;

7.
delete from factura where id_cliente = 2;


8.
delete empleado;

9.
rollback to B;

10.
 aun no hacemos commit en udiplo

11
commit;


12
es el usuario desde el que lo hicimos por lo tanto se ven los cambios (además del commit)



select * from factura;