DECLARE
var_numero NUMBER := &numero;
var_resultado NUMBER;
BEGIN
var_resultado := POWER(var_numero, 2);
DBMS_OUTPUT.PUT_LINE ('El resultado es: '||
var_resultado);
END;
/

#pág 59

CREATE TABLE trabajadores
(
	nombre varchar2(50),
	salarioxhora number(5,2),
	horastrabajadas number(2)
);

insert into trabajadores values ('Changoleón', 300, 12);
insert into trabajadores values ('Jirafapótamo', 200, 8);
insert into trabajadores values ('Vacantílope', 100, 6);
insert into trabajadores values ('Jalató', 150, 8);
insert into trabajadores values ('Dragopavo', 100, 8);
insert into trabajadores values ('Jalató Real', 100, 8);
insert into trabajadores values ('Pío', 100, 8);
insert into trabajadores values ('Blob Rojo', 100, 8);
insert into trabajadores values ('Blob Verde', 100, 8);
insert into trabajadores values ('Blob Azul', 100, 8);


DECLARE
CURSOR ctrabajador is
	SELECT nombre, salarioxhora, horastrabajadas 
	FROM trabajadores;
vnombre varchar2(50);
vsalporhora number(8,2);
vhorastrabajadas number(10);
BEGIN
OPEN ctrabajador;
LOOP
	FETCH ctrabajador INTO vnombre, vsalporhora, vhorastrabajadas;
	exit WHEN ctrabajador%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE(vnombre||' '||
		vsalporhora||' '||
		vhorastrabajadas); 
END LOOP;
CLOSE ctrabajador;
END;
/


#pág 61

DECLARE
CURSOR ctrabajador is
	SELECT nombre, salarioxhora, horastrabajadas 
	FROM trabajadores;
vr_trabajador ctrabajador%ROWTYPE;
BEGIN
OPEN ctrabajador;
LOOP
	FETCH ctrabajador INTO vr_trabajador;
	exit WHEN ctrabajador%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE(vr_trabajador.nombre||' '||
		vr_trabajador.salarioxhora||' '||
		vr_trabajador.horastrabajadas); 
END LOOP;
CLOSE ctrabajador;
END;
/

# pag 62

DECLARE
CURSOR ctrabajador is
	SELECT nombre, salarioxhora, horastrabajadas 
	FROM trabajadores;
vr_trabajador ctrabajador%ROWTYPE;
BEGIN
OPEN ctrabajador;
LOOP
	FETCH ctrabajador INTO vr_trabajador;
	exit WHEN ctrabajador%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE(vr_trabajador.nombre||' '||
		vr_trabajador.salarioxhora||' '||
		vr_trabajador.horastrabajadas); 
END LOOP;
CLOSE ctrabajador;
END;
/

#pag 70
SET SERVEROUTPUT ON
DECLARE
v_salxhora trabajadores.salarioxhora%TYPE;
v_horatrab trabajadores.horastrabajadas%TYPE;
BEGIN
consdato('javier garduño lopez',v_salxhora,v_horatrab);
dbms_output.put_line('El empleado javier garduño lopez tiene un
salario x hora de:' ||'
'|| v_salxhora ||' '|| 'y trabaja ' ||' '|| v_horatrab ||' '|| 'horas');
END;
/

#pag 71

CREATE TABLE estudiantes(
	NOCTA NUMBER(10) CONSTRAINT estudiantes_pk PRIMARY KEY,
	NOMBRE VARCHAR2(50),
	APELLIDOS VARCHAR2(50)
);

INSERT INTO estudiantes VALUES('1001','Javier', 'Martinez Tapia');
INSERT INTO estudiantes VALUES('1002','Roberto', 'Blanco Rodriguez');
INSERT INTO estudiantes VALUES('1003','Jorge', 'Olivera Cabrea');
INSERT INTO estudiantes VALUES('1004','Luis', 'Olivera Cabrera');
INSERT INTO estudiantes VALUES('1005','Marco', 'Vázquez Hernández');
INSERT INTO estudiantes VALUES('1006','Andrés', 'Hernández Vázquez');
INSERT INTO estudiantes VALUES('1007','María', 'Ortíz Ornelas');
INSERT INTO estudiantes VALUES('1008','Gerardo', 'Martinez Capetillo');
INSERT INTO estudiantes VALUES('1009','Sofía', 'Olea Levet');
INSERT INTO estudiantes VALUES('1010','Mónica', 'Jimenez Boss');

@'C:\Users\diplomado\Desktop\MarcoPLSQL\Clase\pbuscaalumno.pls'

SET SERVEROUTPUT ON
DECLARE
cta estudiantes.nocta%TYPE := &n;
v_nombre estudiantes.nombre%TYPE;
v_apellidos estudiantes.APELLIDOS%TYPE;
BEGIN
pbuscaalumno(cta,v_nombre, v_apellidos);
dbms_output.put_line(v_nombre ||' '|| v_apellidos);
END;
/

###PRÁCTICA 1

